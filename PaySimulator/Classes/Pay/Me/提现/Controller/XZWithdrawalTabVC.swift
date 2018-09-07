//
//  XZWithdrawalTabVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/7.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZWithdrawalTabVC: UITableViewController {

    //MARK:--storyBoard属性
    
    @IBOutlet weak var chooseBankBtn: UIButton!
    
    @IBOutlet weak var bankNumTF: UITextField!
    
    @IBOutlet weak var cardNameTF: UITextField!
    @IBOutlet weak var drawalMoneyTF: UITextField!
    
    @IBOutlet weak var creatTimeBtn: UIButton!
    
    @IBOutlet weak var endTimeBtn: UIButton!
    
    @IBOutlet weak var orderNumTF: UITextField!
    @IBOutlet weak var refreshBtn: UIButton!
    
    
    @IBOutlet weak var previewBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewBtn.layer.cornerRadius = 2;
        previewBtn.layer.masksToBounds = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

  //MARK:--拦截跳转，传值
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //goXZWithdrawalBillTabVC
        
        if segue.identifier == "goXZWithdrawalBillTabVC" {
            let vc = segue.destination as! XZWithdrawalBillTabVC
           
            let backBarItem = UIBarButtonItem()
            backBarItem.title = "返回"
            vc.navigationItem.backBarButtonItem = backBarItem
            vc.title = "账单详情"
           
            //传值
 
            let dic = ["bankName":chooseBankBtn.titleLabel?.text,
                       "tailNum" :bankNumTF.text,
                       "cardUserName":cardNameTF.text,
                       "money":drawalMoneyTF.text,
                       "creatTime":creatTimeBtn.titleLabel?.text,
                       "endTime":endTimeBtn.titleLabel?.text,
                       "orderNum":orderNumTF.text,
                       ]
            let model = XZWithdrawalModel(withDarwalDict: dic as! [String : String])
            DDLog("dic = \(dic)")
            vc.withDrawaleModel = model
 
            
        }
        
    }

}
//MARK:--tableViewDataSource

extension XZWithdrawalTabVC {
    

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
        
    }
    
    
    
}


