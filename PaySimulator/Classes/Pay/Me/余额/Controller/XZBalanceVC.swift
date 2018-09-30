//
//  XZBalanceVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBalanceVC: XZBaseViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        topConstraint.constant = DDSafeAreaTopHeight - (DDSafeAreaTopHeight - 44)
        // Do any additional setup after loading the view.
        setupNavBar()
    }
    
}
//MARK:--UI相关
extension XZBalanceVC{
    
        private func setupNavBar(){
 
            self.navBar.title = "余额"
            self.navBar.titleLabelColor = UIColor.white
            self.navBar.titleLabelFont = UIFont.boldSystemFont(ofSize: 18)
            self.navBar.barBackgroundColor = ddBlueColor()
            self.navBar.wr_setLeftButton(normalImage: UIImage(named: "icon_fanhui")!, highlightedImage:UIImage(named: "icon_fanhui")!, title: "我的", titleColor: UIColor.white)
            self.navBar.wr_setRightButton(title: "明细", titleColor: UIColor.white)

        }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    

    override func rightBtnOnClick() {
        
    }

}
