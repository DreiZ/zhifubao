//
//  XZReceivablesTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/5.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZReceivablesTableViewController: UITableViewController {

    var editType : BillType = .Receivables
    //转入 转出按钮
    @IBOutlet weak var transferTypeLeftBtn: UIButton!
    @IBOutlet weak var transferTypeRightBtn: UIButton!
    
    //交易对象
    @IBOutlet weak var nameLabel: UILabel!
    
    
    let receiveTypeArr : [String] = ["余额", "余额宝", "银行卡"]
    let transactionStateArr : [String] = ["交易成功", "待付款"]
    let gradeArr : [String] = ["无", "钻石会员", "铂金会员", "黄金会员", "大众会员"]
    
    var dataAlert : XZMyAlertSheetView = {
        let dataAlert = XZMyAlertSheetView()
        
        
        return dataAlert
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }

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
    func setupUI () {
        
        self.transferTypeLeftBtn.layer.masksToBounds = true
        self.transferTypeLeftBtn.layer.cornerRadius = 4
        
        self.transferTypeRightBtn.layer.masksToBounds = true
        self.transferTypeRightBtn.layer.cornerRadius = 4
        self.transferTypeRightBtn.layer.borderColor = ddColorFromHex("e8e8e8").cgColor
        self.transferTypeRightBtn.layer.borderWidth = 1
        
        self.setupFooterView()
    }
    
    private func setupFooterView() {
        let footer = XZReceivablesFooterView.loadMyView()
        footer.selectBlock = { () in
            if let show = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "XZBillShowViewController") as? XZBillShowViewController{
                self.navigationController?.pushViewController(show, animated: true)
            }
        }
        self.tableView.tableFooterView = footer
    }
}

//t
extension XZReceivablesTableViewController {
    
}
