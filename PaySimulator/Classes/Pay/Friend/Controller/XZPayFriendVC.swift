//
//  XZPayFriendVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayFriendVC: XZBaseVC {

    @IBOutlet weak var myTableView: UITableView!
    
    var dataList : [XZChatModel] = {
        
        XZChatListModel.shareSingleton.getDataFromSql()
        let friendList = XZChatListModel.shareSingleton.chatList
        
        return friendList ?? []
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        XZChatListModel.shareSingleton.getDataFromSql()
        let friendList = XZChatListModel.shareSingleton.chatList
        
        dataList = friendList ?? []
        
        if self.myTableView != nil  {
            self.myTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationUI()//设置导航栏 相关方法
    }
}
//MARK:-- 有关UI设置的所有方法
extension XZPayFriendVC{
    
    //导航栏 设置
    private func setupNavigationUI(){
        
        navigationItem.title = "朋友"
        navBarTintColor = UIColor.white
        navBarBarTintColor = ddBlueColor()
        navBarTitleColor = UIColor.white
        let addBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 20, height: 20), imgName: "icon_tianjia", titleName: "")
        addBtn.addTarget(self, action: #selector(clickAddBtn), for: .touchUpInside)
//       addBtn.backgroundColor = ddRandomColor()
        let firendBtn = XZBaseNavItemBtn(frame: CGRect.zero, imgName: "icon_tongxunlu", titleName: "")
        firendBtn.addTarget(self, action: #selector(clickFriendBtn), for: .touchUpInside)
//        firendBtn.backgroundColor = ddRandomColor()
        let firstBar = UIBarButtonItem(customView: addBtn)
        let secondBar = UIBarButtonItem(customView: firendBtn)
        navigationItem.rightBarButtonItems = [firstBar,secondBar]
        
        
        self.myTableView.separatorStyle = .none
    };
    
    
    
    
    //导航栏右侧按钮
    @objc private func clickAddBtn(){
         DDLog("添加好友")
    }
    
    @objc private func clickFriendBtn(){
        DDLog("通讯录")
       
        let addressBookVC = UIStoryboard(name: "PayFriend", bundle: nil).instantiateViewController(withIdentifier: "XZAddressBookVC") as? XZAddressBookVC
        self.navigationController?.pushViewController(addressBookVC!, animated: true)
        
    }
}
extension XZPayFriendVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = XZPayFriendCellTableViewCell.cellWithTableView(tableView)
        
        let chatModel = dataList[indexPath.row]
        cell.iconImg.image = chatModel.toModel?.headImage
        cell.titleLabel.text = chatModel.toModel?.trueName
        var subTitle = "新的朋友"
        var time = Date().shortTimeTextOfDate()
        if chatModel.messageList.count > 0 {
            let message = chatModel.messageList.last
            time = (message?.date ?? Date()).shortTimeTextOfDate()
            if message?.type == TypeText {
                subTitle = message?.content ?? ""
            }else if message?.type == TypePic {
                subTitle = "[图片]"
            }else if message?.type == TypeTransfer {
                subTitle = "[转账]转账" + (message?.content ?? "") + "元"
            }else if message?.type == TypeVoice {
                subTitle = "[语音]"
            }else if message?.type == TypeRedPacket {
                subTitle = "[红包]" + (message?.content ?? "")
            }
        }
        
        cell.detailLabel.text = subTitle
        cell.timeLabel.text = time
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
 
    //左滑删除
    //编辑样式
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //编辑
        let eAction = UITableViewRowAction(style: .default, title: "编辑") { (rowAction, indexPath) in
         
            print(rowAction,indexPath)
            
        }
        
        eAction.backgroundColor = UIColor.red
        
        //删除
        let dAction = UITableViewRowAction(style: .default, title: "删除聊天") { (rowAction, indexPath) in
            
            print(rowAction,indexPath)
            
        }
        
        dAction.backgroundColor = ddColorFromHex("#a5a5a5")
        return [eAction,dAction]
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatModel = dataList[indexPath.row]
        if  chatModel.toModel != nil {
            let chatvc = XZChatViewController()
            chatvc.to = chatModel.toModel
            chatvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(chatvc, animated: true)
        }
    }
}




