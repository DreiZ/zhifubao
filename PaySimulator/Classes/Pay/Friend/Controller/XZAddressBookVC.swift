//
//  XZAddressBookVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/9.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
import Kingfisher
class XZAddressBookVC: XZBaseVC {

    //MARK:--数据资源
    let iconResource = ["新的朋友","群聊","生活号","生活圈"]
    //MARK:--懒加载数据源(假数据)
    let dataList : [[XZAddressBookModel]] = {
       
      
//        let dataListPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let dataPath = Bundle.main.path(forResource: "AddressBook", ofType: "plist")
        let dataList = NSArray(contentsOfFile: dataPath!)
        var mu = Array<XZAddressBookModel>()
        
        for  dic in dataList!{
            
            mu.append(XZAddressBookModel(dic: dic as! [String : NSObject]))
        
        }
        
     
        
        let resultArray = XZAddressBookManager.sortObjectsAccordingToInitial(with: mu);
        
        DDLog(resultArray![0]);
        
    
        return resultArray as! [[XZAddressBookModel]]
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupNavBar()//导航栏
 
        
        
    }

  
    

}

//MARK:--UI相关
extension XZAddressBookVC{
    
    func setupNavBar(){
        title = "通讯录"
        let addBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 20, height: 20), imgName: "icon_tianjia1", titleName: "")
        addBtn.addTarget(self, action: #selector(clickAddBtn), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addBtn)
        
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
        
        
        
          var cell = tableView.dequeueReusableCell(withIdentifier: "XZAddressSecondCell") as? XZAddressSecondCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("XZAddressSecondCell", owner: nil, options: nil)?.first as? XZAddressSecondCell
        }
        
        let model = self.dataList[indexPath.section-1][indexPath.row]
        
        
        cell?.titleLabel.text = model.username
        let url = URL(string: model.headerImage)
        
        cell?.iconImage.kf.setImage(with: url)
        
        return cell!
        
        
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
        let chatvc = XZChatViewController()
        chatvc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatvc, animated: true)
    }
}

