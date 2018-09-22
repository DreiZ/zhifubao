//
//  XZChatViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
//import FDTake
//import IQKeyboardManagerSwift

class XZChatViewController: XZBaseViewController {
    
    var isSelfSend : Bool = true
    
    var to : XZUserModel?
    var from : XZUserModel?
    
    var dataSource : Array<XZMessageFrame> = []
    var isKeyBoardAppear : Bool = false
    
    var textView : UITextView?
    
    
//懒加载------------------------------
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
        chatBox.delegate = self
        chatBox.moreDeletgate = self
        return chatBox
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        XZFriendListModel.shareSingleton.getDataFromSql()
        let arr = XZFriendListModel.shareSingleton.friendList
        print("zzz - \(String(describing: arr))")
        
        if arr != nil && (arr?.count)! > 1 {
            let xmodel = arr![0]
            self.to = xmodel
            
            let smodel = arr![1]
            self.from = smodel
        }


        self.setupUI()
//        IQKeyboardManager.sharedManager().enable = false
        
        self.iTableView.register(XZChatMessageTextCell.self, forCellReuseIdentifier: TypeText)
        self.iTableView.register(XZChatMessageVoiceCell.self, forCellReuseIdentifier: TypeVoice)
        self.iTableView.register(XZChatMessageTimeCell.self, forCellReuseIdentifier: TypeTime)
        self.iTableView.register(XZChatMessageSystemCell.self, forCellReuseIdentifier: TypeSystem)
        self.iTableView.register(XZChatMessageRedPacketCell.self, forCellReuseIdentifier: TypeRedPacket)
        self.iTableView.register(XZChatMessageTransferCell.self, forCellReuseIdentifier: TypeTransfer)
        self.iTableView.register(XZChatMessageRedPacketOpenCell.self, forCellReuseIdentifier: TypeRedPacketOpen)
        self.iTableView.register(XZChatMessageImageCell.self, forCellReuseIdentifier: TypePic)
        
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
//            {
//                self.sendTimeMessage(systemTime: Date())
//        })
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
//            {
//                self.sendTextMessage(message: "束带结发[愉快][愉快][流汗]上岛咖啡士大夫少的发哦发噶是的水电费水电费水电")
//        })
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
//            {
//                self.sendTransferMessage(money: "102", mark:"" )
//        })
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
//            {
//                self.sendOtherTransferMessage(money: "10")
//        })
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
//            {
//                self.sendRedMessage(content: "是哒是哒高好似好狗")
//        })
//
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
//            {
//                self.sendOtherRedMessage(content: "打扫吧四国赛哦跟佛撒个否问问少的发撒个撒发个")
//        })
//
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+7, execute:
//            {
//                self.sendTextMessage(message: "上看的发个[愉快][愉快][流汗]少的发个")
//        })
//        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute:
//            {
//                self.sendTimeMessage(systemTime: Date())
//        })
//        DispatchQueue.main.asyncAfter(deadline: .now()+8, execute:
//            {
//                self.sendOtherTextMessage(message: "阿松的更好[愉快][愉快][流汗]上少的发哦发噶是的水电费水电费水电")
//        })
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute:
//            {
//                self.sendVoiceMessage(voiceTime: 10, isVoiceRead: false )
//        })
//        
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
//            {
//                self.sendRedOpenMessage(content: "是哒是哒高好似好狗")
//        })
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:
//            {
//                self.sendOtherOpenRedMessage(content: "打扫吧四国赛哦跟佛撒个否问问少的发撒个撒发个")
//        })
//        
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+4, execute:
//            {
//                self.sendSystemMessage(systemLeft: "您领取了徐脂虎的 ", messageRight: "红包", systemImage: nil)
//        })
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute:
//            {
//                self.sendOtherVoiceMessage(voiceTime: 1, isVoiceRead: false)
//        })
//        
//        DispatchQueue.main.asyncAfter(deadline: .now()+4, execute:
//            {
//                self.sendSystemMessage(systemLeft: "您领取了徐脂虎的 ", messageRight: "红包", systemImage: UIImage(named: "redEnvelop-icon"))
//        })

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//         IQKeyboardManager.sharedManager().enable = false
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
            make.height.equalTo(kTabBarHeight)
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
extension XZChatViewController : UITableViewDataSource, UITableViewDelegate ,UIScrollViewDelegate{
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
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let _ =  self.chatBoxViewController.resignFirstResponder()
    }
}


extension XZChatViewController {
    
    func addObject (messageF : XZMessageFrame, isender : Bool) {
        messageF.model?.message?.deliveryState = .delivered
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
//        DispatchQueue.main.async {
//            messageF.model?.message?.deliveryState = .delivered
//            self.iTableView.reloadData()
//        }
    }
    
    //发送 text 数据
    func sendTextMessage(message : String) {
        guard  let fromNickName =  self.from?.nickName,
               let toNickName =  self.to?.nickName else {
            return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeText, content: message, date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: nil, isVoiceRead: false, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        self.addObject(messageF: messageF, isender: true)
//        self.messageSendSucced(messageF: messageF)
    }
    
    func sendOtherTextMessage(message : String) {
        guard  let fromNickName =  self.from?.nickName,
               let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeText, content: message, date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: nil, isVoiceRead: false, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    //语音
    func sendVoiceMessage(voiceTime : Int, isVoiceRead : Bool) {
        guard  let fromNickName =  self.from?.nickName,
               let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeVoice, content: "[语音]", date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: voiceTime, isVoiceRead: isVoiceRead, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    func sendOtherVoiceMessage(voiceTime : Int, isVoiceRead : Bool) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeVoice, content: "[语音]", date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: voiceTime, isVoiceRead: isVoiceRead, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //时间
    func sendTimeMessage(systemTime : Date) {
        guard  let fromNickName =  self.from?.nickName,
            let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createSystemTimeMessageFrame(content: "[时间]", date: Date(), from: fromNickName, to: toNickName, isSender: true, receivedSenderByYourself: false, systemTime: systemTime)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //系统提示
    func sendSystemMessage(systemLeft: String, messageRight: String, systemImage: UIImage?) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createSystemMessageFrame(systemLeft: systemLeft, messageRight: messageRight, systemImage: systemImage, date: Date(), from: fromNickName, to: toNickName, isSender: true, receivedSenderByYourself: false)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //转账
    func sendTransferMessage(money : String, mark : String) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeTransfer, content: money, date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: nil, isVoiceRead: false, transferMark: mark)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    //转账
    func sendOtherTransferMessage(money : String) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeTransfer, content: money, date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: nil, isVoiceRead: false, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //红包
    func sendRedMessage(content : String) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeRedPacket, content: content, date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: nil, isVoiceRead: false, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    //红包
    func sendOtherRedMessage(content : String) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeRedPacket, content: content, date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: nil, isVoiceRead: false, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //红包 open
    func sendRedOpenMessage(content : String) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeRedPacketOpen, content: content, date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: true, receivedSenderByYourself: false, voiceTime: nil, isVoiceRead: false, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    //红包 open
    func sendOtherOpenRedMessage(content : String) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeRedPacketOpen, content: content, date: Date(), path: nil, from: fromNickName, to: toNickName, fileKey: nil, isSender: false, receivedSenderByYourself: false, voiceTime: nil, isVoiceRead: false, transferMark: nil)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //图片
    func sendImageMessage(image : UIImage) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createImageMessageFrame(image: image, date: Date(), from: fromNickName, to: toNickName, isSender: true, receivedSenderByYourself: false)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
    
    func sendOtherImageMessage(image : UIImage) {
        guard  let fromNickName =  self.from?.nickName,
                let toNickName =  self.to?.nickName else {
                return
        }
        
        let messageF : XZMessageFrame = XZMessageHelper.createImageMessageFrame(image: image, date: Date(), from: fromNickName, to: toNickName, isSender: false, receivedSenderByYourself: false)
        
        messageF.model?.message?.toImage = self.to?.headImage
        messageF.model?.message?.fromImage = self.from?.headImage
        
        self.addObject(messageF: messageF, isender: false)
        self.messageSendSucced(messageF: messageF)
    }
    
    //MARK: 发送 Message
    
    func senMessage (message : XZMessage) {
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(message: message)
        
        messageF.model?.message?.toImage = self.isSelfSend ? self.to?.headImage : self.from?.headImage
        messageF.model?.message?.fromImage = self.isSelfSend ? self.from?.headImage : self.to?.headImage
        messageF.model?.isSender = self.isSelfSend
        
        
        self.addObject(messageF: messageF, isender: self.isSelfSend)
    }
}


extension XZChatViewController : XZChatBoxViewControllerDelegate{
    func changeBoxHeight(chatBoxViewController: XZBoxViewController, chatBoxHeight: CGFloat) {
        self.chatBoxViewController.view.snp.remakeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(chatBoxHeight)
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        if chatBoxHeight == kTabBarHeight {
            self.iTableView.reloadData()
            isKeyBoardAppear = false
        }else {
            self.scrollToBottom()
            isKeyBoardAppear = true
        }
        
        if self.textView == nil  {
            self.textView = chatBoxViewController.chatBox.iTextView
        }
    }
    
    func sendTextMessage(chatBoxViewController: XZBoxViewController, message: String) {
        if message.count > 0 {
//            self.sendTextMessage(message: message)
            let messageModel : XZMessage = XZMessage()
            messageModel.type = TypeText
            messageModel.content = message
            self.senMessage(message: messageModel)
        }
    }
    
    func senderImageMessage(chatBoxViewController: XZBoxViewController, image: UIImage, imagePath: String) {
        
    }
    
    func sendVoiceMessage(chatBoxViewController: XZBoxViewController, voicePath: String) {
        
    }
    
    func voiceDidStartRecording() {
        
    }
    
    func voiceRecordSoShort() {
        
    }
    
    func voiceWillDragout(inside: Bool) {
        
    }
    
    func voiceDidCancleRecording() {
        
    }
    
    func videoDidAppeared(chatBoxViewController: XZBoxViewController, videoView: XZChatBoxMoreView) {
        
    }
    
    func sendVideoMessage(chatBoxViewController: XZBoxViewController, videoPath: String) {
        
    }
    
    func sendFileMessage(chatBoxViewController: XZBoxViewController, fileName: String) {
        
    }
}

extension XZChatViewController : XZChatBoxMoreViewDelegate {
    
    func didSelectItem(moreView: XZChatBoxMoreView, selectType: XZChatBoxMoreType) {
        if selectType == XZChatBoxMoreType.album {
            let myPhotoManage  = XZMyPhotoManage.sharedPhotoManage
            
            myPhotoManage.showActionSheetInVC(factherVC: self, aDelegate: self as XZMyPhotoManageDelegate)
        }
        else if selectType == XZChatBoxMoreType.transfer {
            let transfervc = UIStoryboard(name: "chat", bundle: nil).instantiateViewController(withIdentifier: "XZChatTranferViewController") as? XZChatTranferViewController
            transfervc?.to = to
            transfervc?.setMessageData = {(message : XZMessage) in
                    self.senMessage(message: message)
//                self.sendTransferMessage(money: message.content!, mark: message.mark ?? "")
            }
            self.navigationController?.pushViewController(transfervc!, animated: true)
        }
        else if selectType == XZChatBoxMoreType.voice {
            let voicevc = UIStoryboard(name: "chat", bundle: nil).instantiateViewController(withIdentifier: "XZChatVoiceTimeViewController") as? XZChatVoiceTimeViewController
            voicevc?.setMessageData = {(message : XZMessage) in
                self.senMessage(message: message)
//                self.sendVoiceMessage(voiceTime: message.voiceTime, isVoiceRead: message.isVoiceRead)
            }
            self.navigationController?.pushViewController(voicevc!, animated: true)
        }
        else if selectType == XZChatBoxMoreType.time {
            let timevc = XZSystemTimeViewController()
            timevc.setMessageData = {(message : XZMessage) in
                self.senMessage(message: message)
//                self.sendTimeMessage(systemTime: message.systemTime)
            }
            self.navigationController?.pushViewController(timevc, animated: true)
        }
        else if selectType == XZChatBoxMoreType.redPacket {
            
            let redpacketvc = UIStoryboard(name: "RedPacket", bundle: nil).instantiateViewController(withIdentifier: "XZEditRedPacketViewController") as? XZEditRedPacketViewController
            redpacketvc?.to = self.to
            redpacketvc?.from = self.from
            redpacketvc?.setMessageData = { (message : XZMessage) in
                self.senMessage(message: message)
//                self.sendRedMessage(content: message.transferMark!)
            }
            self.navigationController?.pushViewController(redpacketvc!, animated: true)
        }
    }
}

extension XZChatViewController : XZMyPhotoManageDelegate {
    
    func uploadImage(myImage: UIImage) {
        let message : XZMessage = XZMessage()
        message.type = TypePic
        message.image = myImage
        self.senMessage(message: message)
//        self.sendImageMessage(image: myImage)
    }
}
