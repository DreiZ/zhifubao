//
//  XZBillTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBillTableViewController: UITableViewController {

    var billType : BillType = .Receivables
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if billType == .Receivables {
            print("zzz 传值成功")
        }
    }

}

extension XZBillTableViewController {
    func resetData () {
        self.tableView.reloadData()
    }
}
