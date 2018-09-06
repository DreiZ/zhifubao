//
//  XZReceivablesTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/5.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZReceivablesTableViewController: UITableViewController {

    let receiveTypeArr : [String] = ["余额", "余额宝", "银行卡"]
    let transactionStateArr : [String] = ["交易成功", "待付款"]
    let gradeArr : [String] = ["无", "钻石会员", "铂金会员", "黄金会员", "大众会员"]
    
    var dataAlert : XZMyAlertSheetView = {
        let dataAlert = XZMyAlertSheetView()
        
        
        return dataAlert
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupFooterView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index \(indexPath.row)")
        
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                self.dataAlert.title = "选择会员等级"
                self.dataAlert.setDataArr(dataArr: gradeArr)
                self.dataAlert.showInView(showView: self.view)
            }else if indexPath.row == 1 {
                self.dataAlert.title = "收款方式"
                self.dataAlert.setDataArr(dataArr: receiveTypeArr)
                self.dataAlert.showInView(showView: self.view)
            }else if indexPath.row == 2 {
                
            }else if indexPath.row == 3 {
                
            }else if indexPath.row == 4 {
                self.dataAlert.title = "交易状态"
                self.dataAlert.setDataArr(dataArr: transactionStateArr)
                self.dataAlert.showInView(showView: self.view)
            }
        }
        
        
    }


}

extension XZReceivablesTableViewController {
    func setupFooterView() {
        let footer = XZReceivablesFooterView.loadMyView()
        self.tableView.tableFooterView = footer
    }
}
