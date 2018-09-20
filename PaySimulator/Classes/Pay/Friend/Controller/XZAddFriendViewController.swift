//
//  XZAddFriendViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/20.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZAddFriendViewController: XZBaseViewController {

    @IBOutlet weak var contView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var tableViewController : XZAddFriendTableViewController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        XZFriendListModel.shareSingleton.getDataFromSql()
        let arr = XZFriendListModel.shareSingleton.friendList
        print("zzz - \(String(describing: arr))")
        self.setupUI()
        
        if arr != nil && (arr?.count)! > 0 {
            let xmodel = arr!.last
            self.tableViewController?.headImageView.image = xmodel?.headImage
            self.tableViewController?.trueNameTextField.text = xmodel?.trueName
            self.tableViewController?.nickNameTextField.text = xmodel?.nickName
            
        }
   
        
    }
    
    override func rightBtnOnClick() {
        
        guard let headImage = tableViewController?.headImageView.image else {
            XZPublicTools.shareSingleton.showError(subTitle: "请添加图片")
            return
        }
        
        guard let nickname = self.tableViewController?.nickNameTextField.text else {
            XZPublicTools.shareSingleton.showError(subTitle: "请添加昵称")
            return
        }
        if nickname.isEmpty {
            XZPublicTools.shareSingleton.showError(subTitle: "请添加昵称")
            return
        }
        
       
        
        guard let trueName = self.tableViewController?.trueNameTextField.text else {
            XZPublicTools.shareSingleton.showError(subTitle: "请添加真实姓名")
            return
        }
        if trueName.isEmpty {
            XZPublicTools.shareSingleton.showError(subTitle: "请添加真实姓名")
            return
        }
        
        let userModel : XZUserModel = XZUserModel()
        userModel.headImage = headImage
        userModel.nickName = nickname
        userModel.trueName = trueName
        userModel.isHiddenTureName = (tableViewController?.hiddenSwitch.isOn)!
        
        XZFriendListModel.shareSingleton.addUserModel(userModel)
        
        let isSave = XZFriendListModel.shareSingleton.saveSelfToDB()
        if isSave {
            XZPublicTools.shareSingleton.showSuccess(subTitle: "添加好友成功")
            DispatchQueue.global(qos: .default).asyncAfter(deadline: DispatchTime.now()+0.8) {[weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
           
            
        }else{
            XZPublicTools.shareSingleton.showError(subTitle: "添加失败")
        }
    }
}


extension XZAddFriendViewController {
    func setupUI () {
        self.view.backgroundColor = kChatBoxBackColor
        
        topConstraint.constant = 44
        
        self.navBar.title = "添加联系人"
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addFriendToContTableView" {
            let iTabelViewController : XZAddFriendTableViewController = segue.destination as! XZAddFriendTableViewController
            self.tableViewController = iTabelViewController
            
        }
    }
}
