//
//  XZBalanceTabVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBalanceTabVC: UITableViewController {

    //storyBoard属性
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var yuebaoLabel: UILabel!
    
    @IBOutlet weak var goYuebaoBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navBarBarTintColor = .white
//        navBarTintColor = ddBlueColor()
//        title = "余额"
//        navBarTitleColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //导航设置
//        setupNavBar()
        
    }

    

}


//MARK:--UI相关
extension XZBalanceTabVC{
    
//    private func setupNavBar(){
//        self.navigationController?.navigationBar.barTintColor = ddBlueColor()
//
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize:18)];
//        self.navigationController?.navigationBar.isTranslucent = false;//不透明
//    }
    
}
