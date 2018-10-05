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
    
    
    var ilifeNoRead : Bool = false
    var ismallProjectNoRead : Bool = false
    var ilifeCircleNoRead : Bool = false
    
    var lifeDes : String?
    var smallProjectDes : String?
    var lifeCircleDes : String?

    var editBlock : ((_ isNoRead : Bool, _ noReadNum : String )->())?
    
    var noRead : UISwitch = UISwitch()
    var numLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    var lifeDesNoRead : UISwitch = UISwitch()
    var lifeDesLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    
    var smallProjectNoRead : UISwitch = UISwitch()
    var smallProjectDesLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    
    var lifeCircleNoRead : UISwitch = UISwitch()
    var lifeCircleDesLabel : UILabel = {
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
        
        isNoRead = XZChatListModel.shareSingleton.hadNoRead
        noReadNum = XZChatListModel.shareSingleton.noReadNum ?? "0"
        
        ilifeNoRead = XZChatListModel.shareSingleton.lifeNoRead
        ismallProjectNoRead = XZChatListModel.shareSingleton.smallProjectNoRead
        ilifeCircleNoRead = XZChatListModel.shareSingleton.lifeCircleNoRead
        
        lifeDes = XZChatListModel.shareSingleton.lifeDes ?? ""
        smallProjectDes = XZChatListModel.shareSingleton.smallProjectDes ?? ""
        lifeCircleDes = XZChatListModel.shareSingleton.lifeCircleDes ?? ""
        
        
        
        self.navBar.title = "编辑总信息"
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
        self.setupUI()
    }
}

extension XZMessageMainEdit {
    
    override func rightBtnOnClick() {
        isNoRead = noRead.isOn
        noReadNum = numLabel.text ?? "0"
        
        ilifeNoRead = lifeDesNoRead.isOn
        lifeDes = lifeDesLabel.text ?? ""
        
        ismallProjectNoRead = smallProjectNoRead.isOn
        smallProjectDes = smallProjectDesLabel.text ?? ""
        
        ilifeCircleNoRead = lifeCircleNoRead.isOn
        lifeCircleDes = lifeCircleDesLabel.text ?? ""
        
        XZChatListModel.shareSingleton.hadNoRead = self.isNoRead
        XZChatListModel.shareSingleton.noReadNum = noReadNum
        
        XZChatListModel.shareSingleton.lifeNoRead = self.ilifeNoRead
        XZChatListModel.shareSingleton.lifeDes = lifeDes
        
        XZChatListModel.shareSingleton.smallProjectNoRead = self.ismallProjectNoRead
        XZChatListModel.shareSingleton.smallProjectDes = smallProjectDes
        
        XZChatListModel.shareSingleton.lifeCircleNoRead = self.ilifeCircleNoRead
        XZChatListModel.shareSingleton.lifeCircleDes = lifeCircleDes
        
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
        
        lifeDesNoRead.isOn = ilifeNoRead
        lifeDesLabel.text = lifeDes
        
        smallProjectNoRead.isOn = ismallProjectNoRead
        lifeCircleNoRead.isOn =  ilifeCircleNoRead
        
        smallProjectDesLabel.text = smallProjectDes
        lifeCircleDesLabel.text = lifeCircleDes
    }
}

extension XZMessageMainEdit : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "editCell")
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "未读消息"
            cell.accessoryView = self.noRead
        }else if indexPath.row == 1 {
            cell.textLabel?.text = "消息未读数量"
            cell.accessoryType = .disclosureIndicator
            self.numLabel = cell.detailTextLabel!
            cell.detailTextLabel?.text = noReadNum
        }else if indexPath.row == 2 {
            cell.textLabel?.text = "生活号未读"
            cell.accessoryView = self.lifeDesNoRead
        }else if indexPath.row == 3 {
            cell.textLabel?.text = "生活号描述"
            cell.accessoryType = .disclosureIndicator
            self.lifeDesLabel = cell.detailTextLabel!
            cell.detailTextLabel?.text = lifeDes
        }else if indexPath.row == 4 {
            cell.textLabel?.text = "小程序未读"
            cell.accessoryView = self.smallProjectNoRead
        }else if indexPath.row == 5 {
            cell.textLabel?.text = "小程序描述"
            cell.accessoryType = .disclosureIndicator
            self.smallProjectDesLabel = cell.detailTextLabel!
            cell.detailTextLabel?.text = smallProjectDes
        }else if indexPath.row == 6 {
            cell.textLabel?.text = "生活圈未读"
            cell.accessoryView = self.lifeCircleNoRead
        }else if indexPath.row == 7 {
            cell.textLabel?.text = "生活圈描述"
            cell.accessoryType = .disclosureIndicator
            self.lifeCircleDesLabel = cell.detailTextLabel!
            cell.detailTextLabel?.text = lifeCircleDes
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
        }else if indexPath.row == 3 {
            let editVC = XZEditUserInfoVC()
            editVC.textField.text = self.lifeDesLabel.text
            editVC.postValueBlock = {  [weak  self] (value : String) in
                self?.lifeDesLabel.text = value
                self?.lifeCircleDes = value
            }
            editVC.navigationItem.title = "生活号描述"
            
            self.navigationController?.pushViewController(editVC, animated: true)
        }else if indexPath.row == 5 {
            let editVC = XZEditUserInfoVC()
            editVC.textField.text = self.smallProjectDesLabel.text
            editVC.postValueBlock = {  [weak  self] (value : String) in
                self?.smallProjectDesLabel.text = value
                self?.smallProjectDes = value
            }
            editVC.navigationItem.title = "小程序描述"
            
            self.navigationController?.pushViewController(editVC, animated: true)
        }else if indexPath.row == 7 {
            let editVC = XZEditUserInfoVC()
            editVC.textField.text = self.lifeCircleDesLabel.text
            editVC.postValueBlock = {  [weak  self] (value : String) in
                self?.lifeCircleDesLabel.text = value
                self?.lifeCircleDes = value
            }
            editVC.navigationItem.title = "生活圈描述"
            
            self.navigationController?.pushViewController(editVC, animated: true)
        }
    }
}
