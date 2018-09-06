//
//  XZBillShowViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBillShowViewController: XZBaseViewController {
    
    //订单状态 收款和付款
    var type : BillType = BillType.Receivables
    
    @IBOutlet weak var contview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

}


extension XZBillShowViewController {
    func setupUI () {
        navBar.title = "账单详情"
        
        self.contview.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(DDSafeAreaTopHeight)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "XZBillShowSegueTableView" {
            let iTabelViewController : XZBillTableViewController = segue.destination as! XZBillTableViewController
            
            iTabelViewController.billType = BillType.Payment
            
        }
    }
}
