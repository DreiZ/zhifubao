//
//  XZMessageMainEdit.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMessageMainEdit: XZBaseViewController {
    
    var isNoRead : Bool = false
    var noReadNum : String = "0"
    
    var editBlock : ((_ isNoRead : Bool, _ noReadNum : String )->())?
    
    var noRead : UISwitch = UISwitch()
    var numLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let iTableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        tableView.backgroundColor = kChatBackColor
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBar.title = "编辑总信息"
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
        self.setupUI()
    }
}

extension XZMessageMainEdit {
    
    override func rightBtnOnClick() {
        isNoRead = noRead.isOn
        noReadNum = numLabel.text ?? "0"
        
        XZChatListModel.shareSingleton.hadNoRead = self.isNoRead
        XZChatListModel.shareSingleton.noReadNum = noReadNum
        
        let queue = DispatchQueue(label: "saveSelfToDB",qos: .utility)
        queue.async {
            let _  = XZChatListModel.shareSingleton.saveSelfToDB()
        }
        
        if self.editBlock != nil {
            self.editBlock!(self.isNoRead, self.noReadNum)
        }
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
        
        noRead.isOn = isNoRead
        numLabel.text = noReadNum
    }
}

extension XZMessageMainEdit : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "editCell")
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "未读消息"
            cell.accessoryView = self.noRead
        }else {
            cell.textLabel?.text = "消息未读数量"
            cell.accessoryType = .disclosureIndicator
            self.numLabel = cell.detailTextLabel!
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let editVC = XZEditUserInfoVC()
            editVC.textField.text = self.numLabel.text
            editVC.postValueBlock = {  [weak  self] (value : String) in
                self?.numLabel.text = value
                self?.noReadNum = value
            }
            editVC.navigationItem.title = "总未读消息数量"
            
            self.navigationController?.pushViewController(editVC, animated: true)
        }
    }
}
