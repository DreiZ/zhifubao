//
//  XZTopUpVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZTopUpVC: XZBaseVC {

    
    //MARK:--storyBoard属性
    
    @IBOutlet weak var moneyTextField: UITextField!
    
    @IBAction func nexBtn(_ sender: UIButton) {
        
        

        let payMeStoryBoard = UIStoryboard(name: "PayMe", bundle: nil)
        //identifier获取指定的界面（VC）
        let topUpFinishVC = payMeStoryBoard.instantiateViewController(withIdentifier: "XZTopUpFinishVC") as! XZTopUpFinishVC
       
        DDLog("推出")
//        topUpFinishVC.moneyLabel.text = self.moneyTextField.text
        self.navigationController?.pushViewController(topUpFinishVC, animated: true)
//        topUpFinishVC.moneyLabel.text = "测试测试";
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
