//
//  XZChatEditViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatEditViewController: XZBaseViewController {

    var editBlock : ((_ noRead : Bool, _ clearMessage : Bool )->())?
    var toUserModel : XZUserModel?
    
    var noRead : Bool = false
    var clearMessage : Bool = false
    var headImage : UIImage?
    var nickName : String?
    
    let iTableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        tableView.backgroundColor = kChatBackColor
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headImage = toUserModel?.headImage
        nickName = toUserModel?.nickName
        
        self.navBar.title = "设置"
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
        self.setupUI()
    }
}

extension XZChatEditViewController {
    
    override func rightBtnOnClick() {
      
        self.toUserModel?.headImage = headImage
        self.toUserModel?.nickName = nickName
        
        XZFriendListModel.shareSingleton.updateUserModel(self.toUserModel!)
        let queue = DispatchQueue(label: "saveSelfToDB",qos: .utility)
        queue.async {
            let _  = XZChatListModel.shareSingleton.saveSelfToDB()
        }
        
        
        if self.editBlock != nil {
            self.editBlock!(self.noRead, self.clearMessage)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupUI () {
        
        self.view.backgroundColor = kChatBackColor
        self.view.addSubview(self.iTableView)
        self.iTableView.delegate = self
        self.iTableView.dataSource = self
        
        self.iTableView.snp.makeConstraints { (make ) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(DDSafeAreaTopHeight)
        }
        self.iTableView.reloadData()
    }
}

extension XZChatEditViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = XZChatEditMessageCell.cellWithTableView(tableView)
        if indexPath.row == 0 {
            cell.setData(headImage: headImage, nickName: nil, title: "头像")
        }else if indexPath.row == 1 {
            cell.setData(headImage:  nil, nickName: nickName, title: "昵称")
        }else if indexPath.row == 2 {
            cell.setData(headImage: nil, nickName: nil, title: "未读消息")
        }else if indexPath.row == 3 {
            cell.setData(headImage: nil, nickName: nil, title: "清空消息")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let myPhotoManage  = XZMyPhotoManage.sharedPhotoManage
            
            myPhotoManage.showActionSheetInVC(factherVC: self, aDelegate: self as XZMyPhotoManageDelegate)
        }else if indexPath.row == 1 {
            let editVC = XZEditUserInfoVC()
            editVC.textField.text = self.toUserModel?.nickName
            editVC.navigationItem.title = "修改昵称"
            editVC.postValueBlock = {  [weak  self] (value : String) in
                
                self?.nickName = value
                tableView.reloadData()
            }
            self.navigationController?.pushViewController(editVC, animated: true)
        }else if indexPath.row == 2 {
            let alert = UIAlertController(title:nil,message:nil,preferredStyle:UIAlertControllerStyle.actionSheet)
            
            let yes = UIAlertAction(title:"设为未读消息",style:UIAlertActionStyle.default,handler:{(alerts:UIAlertAction) -> Void in
                //暂时理解为回调
                self.noRead = true
                
            })
            //         public convenience init(title: String?, style:     UIAlertActionStyle, handler: ((UIAlertAction) -> Swift.Void)? = nil)
            let no  = UIAlertAction(title:"取消",style:UIAlertActionStyle.destructive,handler:{(alerts:UIAlertAction) -> Void in
                print("i like hunting")})
            
            
            alert.addAction(yes)
            alert.addAction(no)
            
            
            self.present(alert,animated: true,completion: nil)
        }else {
            let alert = UIAlertController(title:nil,message:nil,preferredStyle:UIAlertControllerStyle.actionSheet)
            
            let yes = UIAlertAction(title:"清空聊天记录",style:UIAlertActionStyle.default,handler:{(alerts:UIAlertAction) -> Void in
                //暂时理解为回调
                self.clearMessage = true
                
            })
            //         public convenience init(title: String?, style:     UIAlertActionStyle, handler: ((UIAlertAction) -> Swift.Void)? = nil)
            let no  = UIAlertAction(title:"取消",style:UIAlertActionStyle.destructive,handler:{(alerts:UIAlertAction) -> Void in
                print("i like hunting")})
            
            
            alert.addAction(yes)
            alert.addAction(no)
            
            
            self.present(alert,animated: true,completion: nil)
        }
    }
}


extension XZChatEditViewController : XZMyPhotoManageDelegate {
    func uploadImage(myImage: UIImage) {
        let data = UIImageJPEGRepresentation(myImage, 0.3)
        guard let sdata = data else {
            return
        }
        let resultImage = UIImage(data: sdata)
        headImage = resultImage
        
        self.iTableView.reloadData()
    }  
}
