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
        self.setupUI()

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
        userModel.headImage = headImage
        userModel.nickName = nickname
        userModel.trueName = trueName
        userModel.isHiddenTureName = (tableViewController?.hiddenSwitch.isOn)!
        
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
