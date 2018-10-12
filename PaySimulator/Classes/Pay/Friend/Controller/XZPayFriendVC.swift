//
//  XZPayFriendVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayFriendVC: XZBaseViewController {

    
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
    
    var navController : UINavigationController?
    
    
    var dataList : [XZChatModel] = {
        
        let friendList = XZChatListModel.shareSingleton.chatList
        
        return friendList ?? []
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
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
        if XZChatListModel.shareSingleton.lifeDes?.count == 0 {
            self.lifeDesLabel.text = "简单生活更多优惠"
        }
        
        if XZChatListModel.shareSingleton.smallProjectDes?.count == 0 {
            self.smallProjectDesLabel.text = "发现更多服务"
        }
        
        if XZChatListModel.shareSingleton.lifeCircleDes?.count == 0 {
            self.lifeCLabel.text = "你有朋友更新动态"
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
    override func rightBtnOnClick() {
        self.clickAddBtn()
    }
    
    override func rightBtnTwoOnClick() {
        self.clickFriendBtn()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupNavigationUI()//设置导航栏 相关方法
        setupUI()
    }
}

//MARK:-- 有关UI设置的所有方法
extension XZPayFriendVC{
    
    
    //导航栏 设置
    private func setupNavigationUI(){
        self.view.backgroundColor = kChatBackColor
        
        self.navBar.title = "朋友"
        self.navBar.titleLabelColor = UIColor.white
        self.navBar.titleLabelFont = UIFont.boldSystemFont(ofSize: 18)
        self.navBar.barBackgroundColor = ddBlueColor()
        
        self.navBar.wr_setRightButton(image: UIImage(named: "icon_tianjiaw")!)
        self.navBar.wr_setRightTwoButton(image: UIImage(named: "icon_tongxunlu")!)
        
        if kWindowW == 320 {
            self.navBar.isHidden = true
            let navView = UIView(frame: CGRect(x: 0, y: 0, width: kWindowW, height: 54))
            navView.backgroundColor = ddBlueColor()
            self.view.addSubview(navView)
            
            let label = UILabel()
             label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 15)
            label.textAlignment = .center
            navView.addSubview(label)
            label.text = "朋友"
            
            let button = UIButton()
            button.imageView?.contentMode = .center
            button.isHidden = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.addTarget(self, action: #selector(rightBtnOnClick), for: .touchUpInside)
            navView.addSubview(button)
            button.setImage(UIImage(named: "icon_tianjiaw")!, for: .normal)
            
            let button1 = UIButton()
            button1.imageView?.contentMode = .center
            button1.isHidden = false
            button1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button1.addTarget(self, action: #selector(rightBtnTwoOnClick), for: .touchUpInside)
            navView.addSubview(button1)
            button1.setImage(UIImage(named: "icon_tongxunlu")!, for: .normal)
            
            let top:CGFloat =  14
            let buttonHeight:CGFloat = 44
            let buttonWidth:CGFloat = 50
            let titleLabelHeight:CGFloat = 44
            let titleLabelWidth:CGFloat = 180
            

           
            button.frame = CGRect(x: kWindowW-buttonWidth, y: top, width: buttonWidth, height: buttonHeight)
            button1.frame = CGRect(x: kWindowW-45*2+4, y: top, width: 50, height: buttonHeight)
            label.frame = CGRect(x: (kWindowW-titleLabelWidth)/2.0, y: top, width: titleLabelWidth, height: titleLabelHeight)
            
            topCinstraint.constant = 34
        }
        
        
//        navigationItem.title = "朋友"
//        navBarTintColor = UIColor.white
//        navBarBarTintColor = ddBlueColor()
//        navBarTitleColor = UIColor.white
//        let addBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 20, height: 20), imgName: "icon_tianjiaw", titleName: "")
//        addBtn.addTarget(self, action: #selector(clickAddBtn), for: .touchUpInside)
//        let firendBtn = XZBaseNavItemBtn(frame: CGRect.zero, imgName: "icon_tongxunlu", titleName: "")
//        firendBtn.addTarget(self, action: #selector(clickFriendBtn), for: .touchUpInside)
//        let firstBar = UIBarButtonItem(customView: addBtn)
//        let secondBar = UIBarButtonItem(customView: firendBtn)
//        navigationItem.rightBarButtonItems = [firstBar,secondBar]
        
        
        self.myTableView.separatorStyle = .none
    }
    
    func setupUI () {
        
        if kWindowW == 320 {
            topCinstraint.constant = 34
        }else {
            topCinstraint.constant = DDSafeAreaTopHeight - (DDSafeAreaTopHeight-44)
        }
        
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
        if kWindowW == 320 {
            cell.titleLabel.font = UIFont.systemFont(ofSize: 15)
        }
        
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
