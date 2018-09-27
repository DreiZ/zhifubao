//
//  XZBalanceVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBalanceVC: XZBaseVC {
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavBar()
    }
}
//MARK:--UI相关
extension XZBalanceVC{
    
        private func setupNavBar(){
 
            navBarBarTintColor = ddBlueColor()
            navBarTintColor = .white
            navBarTitleColor = .white
            navBarShadowImageHidden = true;
 
            navigationItem.title = "余额"
            
            //右侧按钮
            let rightBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 40, height: 40), titleName: "明细")
            rightBtn.setTitleColor(UIColor.white, for: .normal)
            rightBtn.addTarget(self, action: #selector(clickRightItem), for: .touchUpInside)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
            
            let backIetm = UIBarButtonItem()
            
            backIetm.title = "返回";
            self.navigationItem.backBarButtonItem = backIetm;
        }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
    
    
     @objc private  func clickRightItem(){
        DDLog(clickRightItem)
    }
    
}
