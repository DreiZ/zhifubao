//
//  XZSeeRedPacketReceiveTabVC.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/27.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZSeeRedPacketReceiveTabVC: UITableViewController {

    //单独生成红包
    var redPacket : XZRedPacketModel?
    
    @IBOutlet weak var tableHeadView: UIView!
    @IBOutlet weak var tableFooterView: UIView!
    
    
    @IBOutlet weak var fromHeadImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var markLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        tableFooterView.frame = CGRect(x: 0, y: 0, width: kWindowW, height: kWindowH-385-DDSafeAreaTopHeight)
        
        fromHeadImageView.image = self.redPacket?.fromUser?.headImage
        nameLabel.text = self.redPacket?.fromUser?.trueName
        markLabel.text = self.redPacket?.mark
        amountLabel.text = (self.redPacket?.amount ?? "0")
        
        fromHeadImageView.layer.cornerRadius = 34
        fromHeadImageView.layer.masksToBounds = true
        
        self.getOrderNo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}


extension XZSeeRedPacketReceiveTabVC {
    private func setupNavBar(){
        navigationItem.title = "支付宝红包"
        navBarTintColor = ddColor(230, 221, 157)
        navBarBarTintColor = ddColor(207, 58, 63)//红色
        navBarShadowImageHidden = true
        navBarTitleColor = ddColor(230, 221, 157)//金色
        statusBarStyle = .lightContent
        let leftBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 20, height: 20), imgName: "red_fanhui", titleName: "返回")
        leftBtn.setTitleColor(ddColor(230, 221, 157), for: .normal)
        leftBtn.addTarget(self, action: #selector(clickLeftBtn), for: .touchUpInside)
        
        let leftBar = UIBarButtonItem(customView: leftBtn)
        
        navigationItem.leftBarButtonItem = leftBar
    }
    
    //返回
    @objc func clickLeftBtn(){
        navigationController?.popViewController(animated: true)
    }
    
    func getOrderNo() {
        var orderNo = (self.redPacket?.time?.stringOfDate(formatter:"yyyyMMdd")) ?? ""
        orderNo = orderNo + "0206302200000000"
        for _ in ["5","8", "0", "0", "2", "9", "0", "8", "8", "3", "2", "3", "7"] {
            orderNo = orderNo + String(format: "%ld", arc4random() % 10)
        }
        self.numLabel.text = "红包编号：" + orderNo
    }
}
