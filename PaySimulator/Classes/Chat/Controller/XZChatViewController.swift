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
        tableView.backgroundColor = UIColor.white
        return tableView
    }()
    
    lazy var chatBoxViewController : XZBoxViewController = {
        let chatBox = XZBoxViewController()
        
        return chatBox
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5, execute:
            {
                self.sendTextMessage(message: "束带结发[愉快][愉快][流汗]上岛咖啡士大夫")
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
        
        let cell = XZChatMessageTextCell.cellWithTableView(tableView)
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
        let messageF : XZMessageFrame = XZMessageHelper.createMessageFrame(type: TypeText, content: message, date: Date(), path: nil, from: "gxz", to: "idz", fileKey: nil, isSender: true, receivedSenderByYourself: false)
        
        self.addObject(messageF: messageF, isender: true)
        self.messageSendSucced(messageF: messageF)
    }
}
