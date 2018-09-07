//
//  XZTopUpFinishVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZTopUpFinishVC: XZBaseVC {

    //MARK:--storyBoard属性
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBAction func finishBtn(_ sender: UIButton) {//完成按钮
        
        self.navigationController?.popViewController(animated: false)
        
    }
    
    
    var moneyStr = ""
    
    @IBAction func paymentMethodBtn(_ sender: UIButton) {//付款方式
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 下面两种方法其实有点区别的，有空可以琢磨一下
        if animated {
            // 隐藏导航栏有动画
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            // 隐藏导航栏没有动画
            self.navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if animated {
            // 隐藏导航栏有动画
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        } else {
            // 隐藏导航栏没有动画
            self.navigationController?.isNavigationBarHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        moneyLabel.text = moneyStr;
         
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
