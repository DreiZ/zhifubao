//
//  XZPayFriendVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayFriendVC: XZBaseVC {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationUI()//设置导航栏 相关方法
    }
    
 

}
//MARK:-- 有关UI设置的所有方法
extension XZPayFriendVC{
    
    //导航栏 设置
    private func setupNavigationUI(){
        
        navigationItem.title = "朋友"
        navBarTintColor = UIColor.white
        navBarBarTintColor = ddBlueColor()
        navBarTitleColor = UIColor.white
        let addBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 20, height: 20), imgName: "icon_tianjia", titleName: "")
        addBtn.addTarget(self, action: #selector(clickAddBtn), for: .touchUpInside)
//       addBtn.backgroundColor = ddRandomColor()
        let firendBtn = XZBaseNavItemBtn(frame: CGRect.zero, imgName: "icon_tongxunlu", titleName: "")
        firendBtn.addTarget(self, action: #selector(clickFriendBtn), for: .touchUpInside)
//        firendBtn.backgroundColor = ddRandomColor()
        let firstBar = UIBarButtonItem(customView: addBtn)
        let secondBar = UIBarButtonItem(customView: firendBtn)
        navigationItem.rightBarButtonItems = [firstBar,secondBar]
        
    };
    
    
    
    
    //导航栏右侧按钮
    @objc private func clickAddBtn(){
         DDLog("添加好友")
    }
    
    @objc private func clickFriendBtn(){
        DDLog("通讯录")
       
        let addressBookVC = UIStoryboard(name: "PayFriend", bundle: nil).instantiateViewController(withIdentifier: "XZAddressBookVC") as? XZAddressBookVC
        self.navigationController?.pushViewController(addressBookVC!, animated: true)
        
    }
}
extension XZPayFriendVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = XZPayFriendCellTableViewCell.cellWithTableView(tableView)
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
 
    //左滑删除
    //编辑样式
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //编辑
        let eAction = UITableViewRowAction(style: .default, title: "编辑") { (rowAction, indexPath) in
         
            print(rowAction,indexPath)
            
        }
        
        eAction.backgroundColor = UIColor.red
        
        //删除
        let dAction = UITableViewRowAction(style: .default, title: "删除聊天") { (rowAction, indexPath) in
            
            print(rowAction,indexPath)
            
        }
        
        dAction.backgroundColor = ddColorFromHex("#a5a5a5")
        return [eAction,dAction]
        
    }
    
    
    
    
}




