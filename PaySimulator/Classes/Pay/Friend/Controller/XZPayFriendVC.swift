//
//  XZPayFriendVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayFriendVC: XZBaseVC {

    
    var isEditMessage : Bool = false
    
    @IBOutlet weak var topCinstraint: NSLayoutConstraint!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var lifeDesLabel: UILabel!
    @IBOutlet weak var smallProjectDesLabel: UILabel!
    @IBOutlet weak var lifeCLabel: UILabel!
    
    @IBOutlet weak var lifeNoReadView: UIView!
    @IBOutlet weak var smallProjectNoReadView: UIView!
    @IBOutlet weak var lifeCNoReadView: UIView!
    
    
    var dataList : [XZChatModel] = {
        
        let friendList = XZChatListModel.shareSingleton.chatList
        
        return friendList ?? []
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        if !isEditMessage {
            
            let friendList = XZChatListModel.shareSingleton.chatList
            
            dataList = friendList ?? []
        }
        
        self.isEditMessage = false
        
        if self.myTableView != nil  {
            self.myTableView.reloadData()
        }
        

        if XZChatListModel.shareSingleton.hadNoRead ,XZChatListModel.shareSingleton.noReadNum?.count != nil  {
            self.navigationController?.tabBarItem.badgeValue = XZChatListModel.shareSingleton.noReadNum
        }else {
            self.navigationController?.tabBarItem.badgeValue = nil
        }
        
        self.lifeNoReadView.isHidden = !XZChatListModel.shareSingleton.lifeNoRead
        self.smallProjectNoReadView.isHidden = !XZChatListModel.shareSingleton.smallProjectNoRead
        self.lifeCNoReadView.isHidden = !XZChatListModel.shareSingleton.lifeCircleNoRead
        
        self.lifeDesLabel.text = XZChatListModel.shareSingleton.lifeDes ?? "简单生活更多优惠"
        self.smallProjectDesLabel.text = XZChatListModel.shareSingleton.smallProjectDes ?? "发现更多服务"
        self.lifeCLabel.text = XZChatListModel.shareSingleton.lifeCircleDes ?? "你有朋友更新动态"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationUI()//设置导航栏 相关方法
        setupUI()
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
        let addBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 20, height: 20), imgName: "icon_tianjiaw", titleName: "")
        addBtn.addTarget(self, action: #selector(clickAddBtn), for: .touchUpInside)
        let firendBtn = XZBaseNavItemBtn(frame: CGRect.zero, imgName: "icon_tongxunlu", titleName: "")
        firendBtn.addTarget(self, action: #selector(clickFriendBtn), for: .touchUpInside)
        let firstBar = UIBarButtonItem(customView: addBtn)
        let secondBar = UIBarButtonItem(customView: firendBtn)
        navigationItem.rightBarButtonItems = [firstBar,secondBar]
        
        
        self.myTableView.separatorStyle = .none
    }
    
    func setupUI () {
        
        topCinstraint.constant = 0
        self.lifeNoReadView.layer.masksToBounds = true
        self.lifeNoReadView.layer.cornerRadius = 4.5
        
        self.smallProjectNoReadView.layer.masksToBounds = true
        self.smallProjectNoReadView.layer.cornerRadius = 4.5
        
        self.lifeCNoReadView.layer.masksToBounds = true
        self.lifeCNoReadView.layer.cornerRadius = 4.5
        
        let leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 28, height: 25))
        let searchImageView = UIImageView()
        searchImageView.image = UIImage(named: "icon_sousuo")
        leftView.addSubview(searchImageView)
        searchImageView.snp.makeConstraints { (make ) in
            make.centerY.equalTo(leftView.snp.centerY)
            make.left.equalTo(leftView.snp.left).offset(11)
        }
        searchTextField.leftView = leftView
        searchTextField.leftViewMode = .always
        
        self.myTableView.backgroundColor = UIColor(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, alpha: 1)
    }
    
    //导航栏右侧按钮
    @objc private func clickAddBtn(){
        //是否有未读消息
        let editvc = XZMessageMainEdit()
        editvc.hidesBottomBarWhenPushed = true
        editvc.editBlock = {(isNoRead : Bool, noReadNum : String) in
            if isNoRead ,noReadNum.count > 0  {
                self.navigationController?.tabBarItem.badgeValue = noReadNum
            }else {
                self.navigationController?.tabBarItem.badgeValue = nil
            }
        }
        self.navigationController?.pushViewController(editvc, animated: true)
    }
    
    
    //添加好友
    @objc private func clickFriendBtn(){
        let addressBookVC = UIStoryboard(name: "PayFriend", bundle: nil).instantiateViewController(withIdentifier: "XZAddressBookVC") as? XZAddressBookVC
        self.navigationController?.pushViewController(addressBookVC!, animated: true)
        
    }
}

extension XZPayFriendVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = XZPayFriendCellTableViewCell.cellWithTableView(tableView)
        
        let chatModel = dataList[indexPath.row]
        cell.iconImg.image = chatModel.toModel?.headImage
        cell.titleLabel.text = chatModel.toModel?.nickName
        
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
        
        cell.noReadView.isHidden = !chatModel.isNoRead
        cell.noDisturbImageView.isHidden = !chatModel.isNoDisturb
        cell.detailLabel.text = subTitle
        cell.timeLabel.text = time
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
 
    //左滑删除
    //编辑样式
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //编辑
        let eAction = UITableViewRowAction(style: .default, title: "编辑") { (rowAction, indexPath) in
            let messagevc = XZChaListEditMessageVC()
            messagevc.hidesBottomBarWhenPushed = true
            messagevc.chatModel = self.dataList[indexPath.row]
            messagevc.editBlock = { () in
                self.isEditMessage = true
            }
            self.navigationController?.pushViewController(messagevc, animated: true)
        }
        
        eAction.backgroundColor = UIColor.red
        
        //删除
        let dAction = UITableViewRowAction(style: .default, title: "删除聊天") { (rowAction, indexPath) in
            
            print(rowAction,indexPath)
            let chatModel = self.dataList[indexPath.row]
            self.dataList.remove(at: indexPath.row)
            self.myTableView.reloadData()
            XZChatListModel.shareSingleton.removeChatModel(chatModel)
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
}
