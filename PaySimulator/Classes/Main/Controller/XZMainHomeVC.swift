//
//  XZMainHomeVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMainHomeVC: XZBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:--storyboard按钮点击事件，按钮tag值已经在xib中添加 顺序 0～5
    
    
    
    @IBAction func clickMainButton(_ sender: XZMainButton) {
        
        switch sender.tag {
        case 0://支付宝模拟器
            
            let tabBarVC = XZPayMainTabBarVC();
            let  keyWindow = UIApplication.shared.keyWindow;
            keyWindow?.rootViewController = tabBarVC;
            
//            self.navigationController?.pushViewController(tabBarVC, animated: false);
            break
        case 1://转账
            
            break
        case 2://余额
            
            break
        case 3://收款账单
            
            break
        case 4://红包
            
            break
        case 5://提现账单
            
            break
        default:
            break
        }
        
           DDLog(sender.tag)
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
