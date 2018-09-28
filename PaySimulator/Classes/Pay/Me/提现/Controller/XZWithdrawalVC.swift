//
//  XZWithdrawalVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/7.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZWithdrawalVC: XZBaseViewController {
    
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        topConstraint.constant = DDSafeAreaTopHeight - (DDSafeAreaTopHeight - 44)
    }

}

//MARK:--UI相关
extension XZWithdrawalVC{
    
    func setupNavBar(){
        self.navBar.title = "转账账单"
    }
}
