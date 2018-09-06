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
    
    @IBAction func finishBtn(_ sender: UIButton) {//完成按钮
    }
    
    @IBAction func paymentMethodBtn(_ sender: UIButton) {//付款方式
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
DDLog("创建创建")
        // Do any additional setup after loading the view.
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
