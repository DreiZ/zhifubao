//
//  XZBillTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBillTableViewController: UITableViewController {

    var billType : BillType?
    var tranferModel : XZTranferModel?
    
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondtitleLabel: UILabel!
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
    
    @IBOutlet weak var electronicReturnCell: UITableViewCell!
    @IBOutlet weak var billHistoryCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let level = ["", "userleve1", "userleve2", "userleve3", "userleve4"]
        toUserImageView.layer.cornerRadius = 12.5
        toUserImageView.layer.masksToBounds = true
    
        userNameLabel.text = self.tranferModel?.toUser?.trueName
        toUserImageView.image = self.tranferModel?.toUser?.headImage
        billstateLabel.text = self.tranferModel?.state
        userLevelImageView.image = UIImage(named: level[(self.tranferModel?.toUser?.level) ?? 0])
        
        
        receiveTypeLabel.text = self.tranferModel?.paymentMethod
        receiveReasonLabel.text = "收款"
        toUserAliCountLabel.text = self.tranferModel?.toUser?.aliCount
        billTypeLabel.text = self.tranferModel?.billClass
        createTimeLabel.text = self.tranferModel?.createTime?.stringOfDate(formatter: "YYYY-MM-dd HH:mm")
        orderNoLabel.text = self.tranferModel?.billNo
        firstTitleLabel.text = "收款方式"
        
        amountLabel.text = self.tranferModel?.amount
        if self.billType! == .Transfer  {
            self.secondtitleLabel.text = "转账备注"
            if self.tranferModel?.isTransferIn ?? true {
                firstTitleLabel.text = "收款方式"
            }else{
                amountLabel.text = "-" + (self.tranferModel?.amount  ?? "")
                firstTitleLabel.text = "付款方式"
            }
            receiveReasonLabel.text = "转账"
        }else {
            self.secondtitleLabel.text = "收款理由" 
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0{
                return 125
            }else if indexPath.row == 5 || indexPath.row == 8 {
                return 13
            }
            return 34
        }else if indexPath.section == 1 {
            if indexPath.row == 1 || indexPath.row == 2 {
                if self.billType! == .Transfer  {
                    return 50
                }else {
                    return 0
                }
            }
        }

        return 50
    }

}

extension XZBillTableViewController {
    func resetData () {
        self.tableView.reloadData()
    }
}
