//
//  XZReceivablesViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/5.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZReceivablesViewController: XZBaseViewController {

    var editType : BillType?
    var iTabelViewController : UITableViewController?
    var tranferModel : XZTranferModel?
    @IBOutlet weak var contView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        
    }
}


extension XZReceivablesViewController {
    func setupUI(){
        if editType! == .Transfer {
            self.navBar.title = "转账账单"
        }else {
            self.navBar.title = "收款账单"
        }
        
        
        self.contView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(DDSafeAreaTopHeight)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "receivableToTabelView" {
            let iTabelViewController : XZReceivablesTableViewController = segue.destination as! XZReceivablesTableViewController
            self.iTabelViewController = iTabelViewController
            iTabelViewController.editType = self.editType
            iTabelViewController.tranferModel = self.tranferModel
            
        }
    }
}

