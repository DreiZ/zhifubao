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
    
    var fUserModel : XZUserModel?
    
    var tableViewController : XZAddFriendTableViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
//        XZFriendListModel.shareSingleton.dropFriendListTable()
        guard let user = fUserModel else {
            return
        }
        tableViewController?.headImageView.image = user.headImage
        tableViewController?.trueNameTextField.text = user.trueName
        tableViewController?.nickNameTextField.text = user.nickName
        tableViewController?.acountLabel.text = user.aliCount
        tableViewController?.telLabel.text = user.tel
        tableViewController?.hiddenSwitch.isOn = user.isHiddenTureName
        let gradeArr : [String] = ["无", "钻石会员", "铂金会员", "黄金会员", "大众会员"]
        tableViewController?.levelLabel.text = gradeArr[user.level]
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
        
        guard let trueName = self.tableViewController?.trueNameTextField.text else {
            XZPublicTools.shareSingleton.showError(subTitle: "请添加真实姓名")
            return
        }
        
 
        let userModel : XZUserModel = XZUserModel()
        userModel.userId = 1000
        userModel.headImage = headImage
        userModel.nickName = nickname
        userModel.trueName = trueName
        userModel.isHiddenTureName = (tableViewController?.hiddenSwitch.isOn)!
        
        userModel.tel = tableViewController?.telLabel.text
        userModel.aliCount = tableViewController?.acountLabel.text
        userModel.level = tableViewController?.level ?? 0
        
        if let arr = XZFriendListModel.shareSingleton.friendList {
            if arr.count > 1 {
                let tempUserModel = arr[arr.count-2]
//                if let user = tempUserModel {
                    userModel.userId = tempUserModel.userId + 1
//                }
            }
        }
        
        if self.fUserModel != nil {
            userModel.userId = (self.fUserModel?.userId)!
            XZFriendListModel.shareSingleton.updateUserModel(userModel)
            let saveStatus = XZFriendListModel.shareSingleton.saveSelfToDB()
            if saveStatus {
                self.navigationController?.popViewController(animated: true)
            }else{
                XZPublicTools.shareSingleton.showError(subTitle: "更新失败")
            }
            return
        }
        XZFriendListModel.shareSingleton.addUserModel(userModel)
        
        let saveStatus = XZFriendListModel.shareSingleton.saveSelfToDB()
        if saveStatus {
            self.navigationController?.popViewController(animated: true)
        }else{
            XZPublicTools.shareSingleton.showError(subTitle: "添加失败")
        }
    }
}


extension XZAddFriendViewController {
    func setupUI () {
        self.view.backgroundColor = kChatBoxBackColor
        
        topConstraint.constant = 44
        if kWindowW == 320 {
            topConstraint.constant = 34
        }
        
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
