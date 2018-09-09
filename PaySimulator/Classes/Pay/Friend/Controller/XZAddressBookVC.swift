//
//  XZAddressBookVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/9.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZAddressBookVC: XZBaseVC {

    //MARK:--数据资源
    let iconResource = ["新的朋友","群聊","生活号","生活圈"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupNavBar()//导航栏
        // Do any additional setup after loading the view.
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
    }
}


//MARK:--tableViewDelegate
extension XZAddressBookVC:UITableViewDataSource,UITableViewDelegate{
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        
        return 6
        
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
        return cell!
        
        
    }
    
    
    
    
    
}

