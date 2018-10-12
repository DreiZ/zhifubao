//
//  XZWithdrawalBillViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/28.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZWithdrawalBillViewController: XZBaseViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
  
    var withDrawaleModel : XZWithdrawalModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topConstraint.constant = DDSafeAreaTopHeight - (DDSafeAreaTopHeight - 44)
        if kWindowW == 320 {
            topConstraint.constant = 34
        }
        self.navBar.title = "账单详情"
    }
    
    
    //MARK:--拦截跳转，传值
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //goXZWithdrawalBillTabVC
        
        if segue.identifier == "withdrawalToTableView" {
            let vc = segue.destination as! XZWithdrawalBillTabVC
            vc.withDrawaleModel = self.withDrawaleModel
        }
    }
}
