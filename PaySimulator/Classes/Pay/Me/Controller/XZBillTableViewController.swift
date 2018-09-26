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
    var tranferModel : XZTranferModel?
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLevelImageView: UIImageView!
    @IBOutlet weak var toUserImageView: UIImageView!
    @IBOutlet weak var toUserBtn: UIButton!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var receiveTypeLabel: UILabel!
    @IBOutlet weak var receiveReasonLabel: UILabel!
    @IBOutlet weak var toUserAliCountLabel: UILabel!
    @IBOutlet weak var billTypeLabel: UILabel!
    
    @IBOutlet weak var billstateLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    @IBOutlet weak var orderNoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if billType == .Receivables {
            print("zzz 传值成功")
        }
        let level = ["", "userleve1", "userleve2", "userleve3", "userleve4"]
        toUserImageView.layer.cornerRadius = 12.5
        toUserImageView.layer.masksToBounds = true
    
        userNameLabel.text = self.tranferModel?.toUser?.trueName
        toUserImageView.image = self.tranferModel?.toUser?.headImage
        billstateLabel.text = self.tranferModel?.state
        userLevelImageView.image = UIImage(named: level[(self.tranferModel?.toUser?.level) ?? 0])
        
        amountLabel.text = self.tranferModel?.amount
        receiveTypeLabel.text = self.tranferModel?.paymentMethod
        receiveReasonLabel.text = "收款"
        toUserAliCountLabel.text = self.tranferModel?.toUser?.aliCount
        billTypeLabel.text = self.tranferModel?.billClass
        createTimeLabel.text = self.tranferModel?.createTime?.stringOfDate(formatter: "YYYY-MM-dd HH:mm")
        orderNoLabel.text = self.tranferModel?.billNo
    }

}

extension XZBillTableViewController {
    func resetData () {
        self.tableView.reloadData()
    }
}
