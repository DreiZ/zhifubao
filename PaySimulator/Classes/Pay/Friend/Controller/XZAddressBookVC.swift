//
//  XZAddressBookVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/9.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
import Kingfisher
class XZAddressBookVC: XZBaseViewController {
    
    var selectUserBlock : ((_ user : XZUserModel) -> ())?
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    let searchView : XZSearchAddressBookViewController = XZSearchAddressBookViewController()
    
    //MARK:--数据资源
    let iconResource = ["新的朋友","群聊","生活号","生活圈"]
    //MARK:--懒加载数据源(假数据)
    var dataList : [[XZUserModel]] = {
 
        var friendList = XZFriendListModel.shareSingleton.friendList
//        移除列表中本人数据
//        friendList?.removeLast()
 
        let resultArray = XZAddressBookManager.sortObjectsAccordingToInitial(with: friendList);
      
        return resultArray as! [[XZUserModel]]
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        let friendList = XZFriendListModel.shareSingleton.friendList
//        移除列表中本人数
//        friendList?.removeLast()
        let resultArray = XZAddressBookManager.sortObjectsAccordingToInitial(with: friendList);
        dataList = resultArray as! [[XZUserModel]]
        
        if self.myTableView != nil  {
            self.myTableView.reloadData()
        }
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topConstraint.constant = DDSafeAreaTopHeight - (DDSafeAreaTopHeight - 44)
        if kWindowW == 320 {
            topConstraint.constant = 34
        }
        
        setupNavBar()//导航栏
        self.myTableView.separatorStyle = .none
        
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
        
        self.addChildViewController(self.searchView)
    }
    
    @IBAction func SearchOnClick(_ sender: Any) {
//        let searchVC = XZSearchAddressBookViewController()
//
//        self.navigationController?.pushViewController(searchVC, animated: true)
        self.searchView.view.frame = CGRect(x: 0, y: (DDSafeAreaTopHeight - 44), width: kWindowW, height: kWindowH)
        self.view.addSubview(self.searchView.view)
    }
    
}

//MARK:--UI相关
extension XZAddressBookVC{
    
    func setupNavBar(){
        self.navBar.title = "通讯录"
        self.navBar.wr_setRightButton(image: UIImage(named: "icon_tianjia1")!)
    }

    override func rightBtnOnClick() {
        self.clickAddBtn()
    }
    
    //导航栏右侧按钮
    @objc private func clickAddBtn(){
        DDLog("添加好友")
        let addfriendvc = UIStoryboard(name: "PayFriend", bundle: nil).instantiateViewController(withIdentifier: "XZAddFriendViewController")
        addfriendvc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addfriendvc, animated: true)
    }
}


//MARK:--tableViewDelegate
extension XZAddressBookVC:UITableViewDataSource,UITableViewDelegate{
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataList.count+1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        
        return self.dataList[section-1].count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "XZAddressFirstCell") as? XZAddressFirstCell
            
            if cell == nil{
                cell = Bundle.main.loadNibNamed("XZAddressFirstCell", owner: nil, options: nil)?.first as? XZAddressFirstCell
                
            }
            cell?.iconImage.image = UIImage(named: iconResource[indexPath.row])
            cell?.titleLabel.text = iconResource[indexPath.row];
          
            return cell!
        }

        let model = self.dataList[indexPath.section-1][indexPath.row]
        if model.isHiddenTureName {
            var cell = tableView.dequeueReusableCell(withIdentifier: "XZAddressFirstCell") as? XZAddressFirstCell
            if cell == nil {
                cell = Bundle.main.loadNibNamed("XZAddressFirstCell", owner: nil, options: nil)?.first as? XZAddressFirstCell
            }
            
            cell?.titleLabel.text = model.nickName
            cell?.iconImage.image = model.headImage
            
            return cell!
        }else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "XZAddressSecondCell") as? XZAddressSecondCell
            if cell == nil {
                cell = Bundle.main.loadNibNamed("XZAddressSecondCell", owner: nil, options: nil)?.first as? XZAddressSecondCell
            }
            
            cell?.titleLabel.text = model.nickName
            if model.isHiddenTureName {
                cell?.detailLabel.text = ""
            }else {
                cell?.detailLabel.text = model.trueName
            }
            
            
            if model.headImage == nil {
                cell?.iconImage.image = UIImage(named: "APC_defaultheadicon_1")
            }else {
                cell?.iconImage.image = model.headImage
            }
            
            return cell!
        }
    }
    
    //分区头
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            return nil
        }
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: kWindowW, height: 20))
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: kWindowW-10, height: 20))
        let addressBookModel = self.dataList[section-1].first
        label.text = addressBookModel?.acapital;
        label.font = UIFont.systemFont(ofSize: 14)
        headerView.addSubview(label)
        
        return headerView;
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return  0.01;
        }
        return 20
    }
    
    //MARK:--右侧 索引列表
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var arr = [String]()
        arr.append(UITableViewIndexSearch)
        for item in dataList {
            let title  = item.first?.acapital
            arr.append(title!)
        }
        
        return arr
        
    }
    
    //点击索引
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        let NSIndex = IndexPath(row: 0, section: index)
        
        tableView.scrollToRow(at: NSIndex, at: .top, animated: true)
        return index
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section > 0 {
            if self.selectUserBlock != nil {
                self.selectUserBlock!(self.dataList[indexPath.section-1][indexPath.row])
                self.navigationController?.popViewController(animated: true)
                return
            }
            
            let chatvc = XZChatViewController()
            chatvc.to = self.dataList[indexPath.section-1][indexPath.row]
            chatvc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(chatvc, animated: true)
        }
    }
    
    //左滑删除
    //编辑样式
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if indexPath.section > 0 {
            
            //编辑
            let eAction = UITableViewRowAction(style: .default, title: "编辑") { (rowAction, indexPath) in
                let addfriendvc = UIStoryboard(name: "PayFriend", bundle: nil).instantiateViewController(withIdentifier: "XZAddFriendViewController") as! XZAddFriendViewController
                addfriendvc.hidesBottomBarWhenPushed = true
                addfriendvc.fUserModel = self.dataList[indexPath.section-1][indexPath.row]
                self.navigationController?.pushViewController(addfriendvc, animated: true)
                
            }
            eAction.backgroundColor = UIColor.red
            
            //删除
            let dAction = UITableViewRowAction(style: .default, title: "删除") { (rowAction, indexPath) in
                let model = self.dataList[indexPath.section-1][indexPath.row]
                if model.userId == 9999 {
                    XZPublicTools.shareSingleton.showError(subTitle: "本人账号无法删除")
                    return
                }
                self.dataList[indexPath.section-1].remove(at: indexPath.row)
                if self.dataList[indexPath.section-1].count == 0 {
                    self.dataList.remove(at: indexPath.section-1)
                }
                
                var friendList = XZFriendListModel.shareSingleton.friendList
                var index = 0
                for item in friendList ?? [] {
                    if item.userId == model.userId {
                        friendList?.remove(at: index)
                        break
                    }
                    index += 0
                }
                
                XZFriendListModel.shareSingleton.friendList = friendList
                let _ = XZFriendListModel.shareSingleton.saveSelfToDB()
                self.myTableView.reloadData()
            }
            
            dAction.backgroundColor = ddColorFromHex("#a5a5a5")
            return [eAction,dAction]
        }
        return nil
    }
}

