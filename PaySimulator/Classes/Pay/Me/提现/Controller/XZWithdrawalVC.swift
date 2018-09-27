//
//  XZWithdrawalVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/7.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZWithdrawalVC: XZBaseVC {
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        setupNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        // Do any additional setup after loading the view.
    }

}
//MARK:--UI相关
extension XZWithdrawalVC{
    
    func setupNavBar(){
//        let backIetm = UIBarButtonItem()
        
 
        title = "提现账单"
        
    }
    
    
}
