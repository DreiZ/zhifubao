//
//  XZChatViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatViewController: XZBaseViewController {
    
    var dataSource : Array<XZMessageFrame> = []
    var isKeyBoardAppear : Bool = false
    
    lazy var iTableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
        return tableView
    }()
    
    lazy var chatBoxViewController : XZBoxViewController = {
        let chatBox = XZBoxViewController()
        
        return chatBox
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        
        
        self.iTableView.register(XZChatMessageTextCell.self, forCellReuseIdentifier: TypeText)
        self.iTableView.register(XZChatMessageVoiceCell.self, forCellReuseIdentifier: TypeVoice)
        self.iTableView.register(XZChatMessageTimeCell.self, forCellReuseIdentifier: TypeTime)
        self.iTableView.register(XZChatMessageSystemCell.self, forCellReuseIdentifier: TypeSystem)
        self.iTableView.register(XZChatMessageRedPacketCell.self, forCellReuseIdentifier: TypeRedPacket)
        self.iTableView.register(XZChatMessageTransferCell.self, forCellReuseIdentifier: TypeTransfer)
        self.iTableView.register(XZChatMessageRedPacketOpenCell.self, forCellReuseIdentifier: TypeRedPacketOpen)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
            {
                self.sendTimeMessage(systemTime: Int(Date().timeIntervalSinceReferenceDate))
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
            {
                self.sendTextMessage(message: "束带结发[愉快][愉快][流汗]上岛咖啡士大夫少的发哦发噶是的水电费水电费水电")
        })

        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
            {
                self.sendTransferMessage(money: "102")
        })

        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
            {
                self.sendOtherTransferMessage(money: "10")
        })

        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
            {
                self.sendRedMessage(content: "是哒是哒高好似好狗")
        })

        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
            {
                self.sendOtherRedMessage(content: "打扫吧四国赛哦跟佛撒个否问问少的发撒个撒发个")
        })

        
        DispatchQueue.main.asyncAfter(deadline: .now()+7, execute:
            {
                self.sendTextMessage(message: "上看的发个[愉快][愉快][流汗]少的发个")
        })
        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute:
            {
                self.sendTimeMessage(systemTime: Int(Date().timeIntervalSinceReferenceDate))
        })
        DispatchQueue.main.asyncAfter(deadline: .now()+8, execute:
            {
                self.sendOtherTextMessage(message: "阿松的更好[愉快][愉快][流汗]上少的发哦发噶是的水电费水电费水电")
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute:
            {
                self.sendVoiceMessage(voiceTime: 10)
        })
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
            {
                self.sendRedOpenMessage(content: "是哒是哒高好似好狗")
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
            {
                self.sendOtherOpenRedMessage(content: "打扫吧四国赛哦跟佛撒个否问问少的发撒个撒发个")
        })
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+4, execute:
            {
                self.sendSystemMessage(systemLeft: "您领取了徐脂虎的 ", messageRight: "红包", systemImage: nil)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute:
            {
                self.sendOtherVoiceMessage(voiceTime: 1)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now()+4, execute:
            {
                self.sendSystemMessage(systemLeft: "您领取了徐脂虎的 ", messageRight: "红包", systemImage: UIImage(named: "redEnvelop-icon"))
        })

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension XZChatViewController {
    private func setupUI ()  {
        self.view.backgroundColor = UIColor.white
        self.setNavigation()
        self.setupMainUI()
    }
    
    private func setupMainUI ()  {
        self.addChildViewController(self.chatBoxViewController)
        self.view.addSubview(self.chatBoxViewController.view)
        self.view.addSubview(self.iTableView)
        
        self.chatBoxViewController.view.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(kTabBarHeight + kChatMoreViewHeight)
        }
        
        self.iTableView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.view).offset(DDSafeAreaTopHeight)
            make.bottom.equalTo(self.chatBoxViewController.view.snp.top)
        }
    }
    
    
    private func setNavigation () {
        self.navBar.title = "某某某"
        self.navBar.titleLabelColor = UIColor.white
        self.navBar.barBackgroundColor = ddBlueColor()
        self.navBar.wr_setLeftButton(normalImage: UIImage(named: "icon_fanhui")!, highlightedImage: UIImage(named: "icon_fanhui")!, title: "朋友", titleColor: UIColor.white)
        self.navBar.wr_setRightButton(normal: UIImage(named: "icon_chat")!, highlighted: UIImage(named: "icon_chat")!)
    }
    
}


//MARK : tableview 数据源 & 协议代理
extension XZChatViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj : XZMessageFrame = self.dataSource[indexPath.row]
        
        let cell = XZBaseMessageCell.cellWithTableView(tableView, identifier: (obj.model?.message?.type) ?? "XZBaseMessageCell")
        cell.setModelFrame(modelFrame: obj)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let obj : XZMessageFrame = self.dataSource[indexPath.row]
        return obj.cellHight ?? 44
    }
}


extension XZChatViewController {
    
    func addObject (messageF : XZMessageFrame, isender : Bool) {
        self.dataSource.append(messageF)
        
        self.iTableView.reloadData()
        if isender || isKeyBoardAppear {
            self.scrollToBottom()
        }
    }
    
    func scrollToBottom() {
        if self.dataSource.count > 0 {
            self.iTableView.scrollToRow(at: IndexPath.init(row: self.dataSource.count - 1, section: 0), at: .bottom, animated: false)
        }
    }
    
    func messageSendSucced(messageF : XZMessageFrame) {
        DispatchQueue.main.async {
            messageF.model?.message?.deliveryState = .delivered
            self.iTableView.reloadData()
        }
    }
    
    //发送 text 数据
    func sendTextMessage(message : String) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeText, content: message, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: nil)
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    func sendOtherTextMessage(message : String) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeText, content: message, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: nil)
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    //语音
    func sendVoiceMessage(voiceTime : Int) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeVoice, content: "[语音]", date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: voiceTime)
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    func sendOtherVoiceMessage(voiceTime : Int) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeVoice, content: "[语音]", date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: voiceTime)
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //时间
    func sendTimeMessage(systemTime : Int) {
        let messageF : XZMessageFrame = XZMessageHelper.createSystemTimeMessageFrame(content: "[时间]", date: Date(), from: "gxz", to: "idz", isSender: true, receivedSenderByYourself: false, systemTime: systemTime)
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //系统提示
    func sendSystemMessage(systemLeft: String, messageRight: String, systemImage: UIImage?) {
        let messageF : XZMessageFrame = XZMessageHelper.createSystemMessageFrame(systemLeft: systemLeft, messageRight: messageRight, systemImage: systemImage, date: Date(), from: "gxz", to: "idz", isSender: true, receivedSenderByYourself: false)
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //转账
    func sendTransferMessage(money : String) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeTransfer, content: money, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: nil)
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    //转账
    func sendOtherTransferMessage(money : String) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeTransfer, content: money, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: nil)
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //红包
    func sendRedMessage(content : String) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeRedPacket, content: content, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: nil)
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    //红包
    func sendOtherRedMessage(content : String) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeRedPacket, content: content, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: nil)
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //红包 open
    func sendRedOpenMessage(content : String) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeRedPacketOpen, content: content, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: nil)
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    //红包 open
    func sendOtherOpenRedMessage(content : String) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeRedPacketOpen, content: content, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: nil)
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
}
