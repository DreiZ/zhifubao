//
//  XZSearchAddressBookViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/29.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZSearchAddressBookViewController: XZBaseViewController {

    
    var searchList : [XZUserModel] = []
    var userDataList : [XZUserModel]?
    
    let iTableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
        tableView.separatorStyle = .none
        tableView.backgroundColor = kChatBackColor
        return tableView
    }()
    
    let searchTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 1)
        
        let leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 28, height: 25))
        let searchImageView = UIImageView()
        searchImageView.image = UIImage(named: "icon_sousuo")
        leftView.addSubview(searchImageView)
        searchImageView.snp.makeConstraints { (make ) in
            make.centerY.equalTo(leftView.snp.centerY)
            make.left.equalTo(leftView.snp.left).offset(11)
        }
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        XZFriendListModel.shareSingleton.getDataFromSql()
        self.userDataList = XZFriendListModel.shareSingleton.friendList
        
        self.navBar.title = "联系人"
        self.setupUI()
    }
}

extension XZSearchAddressBookViewController {
    func setupUI () {
        self.view.backgroundColor = kChatBackColor
        
        let topView = UIView()
        topView.backgroundColor = UIColor.white
        self.view.addSubview(topView)
        topView.snp.makeConstraints { (make ) in
            make.left.top.right.equalTo(self.view)
            make.height.equalTo(44)
        }
        
        
        topView.addSubview(self.searchTextField)
        
        let searchBtn = UIButton()
        topView.addSubview(searchBtn)
        searchBtn.setTitle("取消", for: .normal)
        searchBtn.setTitleColor(ddBlueColor(), for: .normal)
        searchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        searchBtn.addTarget(self, action: #selector(cancleBtnClick), for: .touchUpInside)
        
        searchBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(topView.snp.centerY)
            make.width.equalTo(50)
            make.right.equalTo(topView.snp.right)
            make.top.bottom.equalTo(topView)
        }
        
        searchTextField.snp.makeConstraints { (make ) in
            make.centerY.equalTo(topView.snp.centerY)
            make.left.equalTo(topView.snp.left).offset(10)
            make.height.equalTo(25)
            make.right.equalTo(searchBtn.snp.left)
        }
        searchTextField.addTarget(self, action: #selector(textFieldDidChange (textField:)), for: UIControlEvents.editingChanged)
        
        let lineView = UIView()
        lineView.backgroundColor = kChatBackColor
        topView.addSubview(lineView)
        lineView.snp.makeConstraints { (make ) in
            make.left.bottom.right.equalTo(topView)
            make.height.equalTo(0.5)
        }
        
        self.view.addSubview(self.iTableView)
        self.iTableView.delegate = self
        self.iTableView.dataSource = self
        self.iTableView.snp.makeConstraints { (make ) in
            make.left.bottom.right.equalTo(self.view)
            make.top.equalTo(topView.snp.bottom)
        }
    }
    
    @objc func cancleBtnClick() {
        self.view.removeFromSuperview()
    }
    
    @objc func textFieldDidChange(textField : UITextField) {
        self.searchKey(sstring: textField.text ?? "" )
    }
}

extension XZSearchAddressBookViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.searchList[indexPath.row]
        let cell = XZUserTableViewCell.cellWithTableView(tableView)
        cell.setData(headImage: model.headImage, nickName: model.nickName, trueName: model.trueName)

        cell.imageView?.frame = CGRect(x: 15, y: 8, width: 32, height: 32)
            
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatvc = XZChatViewController()
        chatvc.to = self.searchList[indexPath.row]
        chatvc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatvc, animated: true)
    }
}

extension XZSearchAddressBookViewController {
    func searchKey(sstring : String) {
        self.searchList.removeAll()
        
        let key = sstring.lowercased()
        
        for item in self.userDataList! {
            let name = item.nickName?.lowercased()
            let namePinyin = item.nickName?.transformToPinyin().lowercased()
            let nameFirstLetter = item.nickName?.first
            
            let rang1 = name?.zranges(of: key)
            if !(rang1?.isEmpty)! {
                self.searchList.append(item)
            }else {
                if nameFirstLetter == key.first {
                    self.searchList.append(item)
                }else {
                    let range2 = namePinyin?.zranges(of: key)
                    if !(range2?.isEmpty)!{
                        self.searchList.append(item)
                    }
                }
            }
        }
        
        for item in self.userDataList! {
            let name = item.trueName?.lowercased()
            let namePinyin = item.trueName?.transformToPinyin().lowercased()
            let nameFirstLetter = item.trueName?.first
            
            let rang1 = name?.zranges(of: key)
            if !(rang1?.isEmpty)! {
                self.searchList.append(item)
            }else {
                if nameFirstLetter == key.first {
                    self.searchList.append(item)
                }else {
                    let range2 = namePinyin?.zranges(of: key)
                    if !(range2?.isEmpty)!{
                        if !self.searchList.contains(item){
                            self.searchList.append(item)
                        }
                    }
                }
            }
        }
        
        
        
        self.iTableView.reloadData()
    }
}
