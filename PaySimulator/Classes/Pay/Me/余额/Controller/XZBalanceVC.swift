//
//  XZBalanceVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBalanceVC: XZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
//        setupNavBar()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK:--UI相关
extension XZBalanceVC{
    
        private func setupNavBar(){
 
            navBarBarTintColor = ddBlueColor()
            navBarTintColor = .white
            navBarTitleColor = .white
            navBarShadowImageHidden = true;
            statusBarStyle = .lightContent
            navigationItem.title = "余额"
            
            //右侧按钮
            let rightBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 40, height: 40), titleName: "明细")
            rightBtn.setTitleColor(UIColor.white, for: .normal)
            rightBtn.addTarget(self, action: #selector(clickRightItem), for: .touchUpInside)
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
            
 
        }
    
     @objc private  func clickRightItem(){
        DDLog(clickRightItem)
    }
    
}
