//
//  XZChaListEditMessageVC.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/29.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChaListEditMessageVC: XZBaseViewController {

    
    var noRead : UISwitch = UISwitch()
    var noDisturb : UISwitch = UISwitch()
    
    let iTableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        tableView.backgroundColor = kChatBackColor
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navBar.title = "编辑信息"
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
        self.setupUI()
    }
}

extension XZChaListEditMessageVC {
    
    override func rightBtnOnClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupUI () {
        
        self.view.backgroundColor = kChatBackColor
        self.view.addSubview(self.iTableView)
        self.iTableView.delegate = self
        self.iTableView.dataSource = self
        
        self.iTableView.snp.makeConstraints { (make ) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(DDSafeAreaTopHeight)
        }
        self.iTableView.reloadData()
    }
}

extension XZChaListEditMessageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "editCell")
        if indexPath.row == 0 {
            cell.textLabel?.text = "未读消息"
            cell.accessoryView = self.noRead
        }else {
            cell.textLabel?.text = "消息勿扰"
            cell.accessoryView = self.noDisturb
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
