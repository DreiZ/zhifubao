//
//  XZWithdrawalBillTabVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/7.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZWithdrawalBillTabVC: UITableViewController {

    
    //MARK:--storyBoard属性
    @IBOutlet weak var bankImageView: UIImageView!
    @IBOutlet weak var bankNameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var withDrawalDesLabel: UILabel!
    @IBOutlet weak var creatTimeLabel: UILabel!
    @IBOutlet weak var middleTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var toBankLabel: UILabel!
    @IBOutlet weak var billClassLabel: UILabel!
    @IBOutlet weak var billCreateTimeLabel: UILabel!
    @IBOutlet weak var orderNoLabel: UILabel!
    
    
    
    @IBOutlet weak var arriveTimeBtn: UIButton!
    @IBOutlet weak var arriveTimeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    
    var withDrawaleModel : XZWithdrawalModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        DDLog("传值 = \(String(describing: withDrawaleModel))")
        
        self.bankImageView.image = self.withDrawaleModel?.bankImage
        self.bankNameLabel.text = self.withDrawaleModel?.bankName
        self.amountLabel.text = self.withDrawaleModel?.money
        self.withDrawalDesLabel.text = "快速提现"
        self.creatTimeLabel.text = self.withDrawaleModel?.creatTime?.stringOfDate(formatter: "MM:dd HH:mm")
        self.middleTimeLabel.text = self.withDrawaleModel?.creatTime?.stringOfDate(formatter: "MM:dd HH:mm")
        self.endTimeLabel.text = self.withDrawaleModel?.endTime?.stringOfDate(formatter: "MM:dd HH:mm")
        self.toBankLabel.text = (self.withDrawaleModel?.bankName ?? "") + "(\(self.withDrawaleModel?.bankName ?? ""))" + (self.withDrawaleModel?.cardUserName ?? "")
        
        self.billClassLabel.text = "其他"
        self.billCreateTimeLabel.text = self.withDrawaleModel?.creatTime?.stringOfDate(formatter: "YYYY-MM-dd HH:mm")
        self.orderNoLabel.text = self.withDrawaleModel?.orderNum
        self.statusLabel.text = "交易成功"

//        @IBOutlet weak var arriveTimeBtn: UIButton!
//        @IBOutlet weak var arriveTimeLabel: UILabel!
    }

   
    // MARK: - Table view data source

}
