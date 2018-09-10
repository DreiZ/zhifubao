//
//  XZChatViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatViewController: XZBaseViewController {
    
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "123"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
