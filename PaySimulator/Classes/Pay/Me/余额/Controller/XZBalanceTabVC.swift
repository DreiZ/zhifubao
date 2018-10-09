//
//  XZBalanceTabVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBalanceTabVC: UITableViewController {

    //storyBoard属性
    var userModel : XZUserModel?
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var yuebaoLabel: UILabel!
    @IBOutlet weak var goYuebaoBtn: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userModel = XZFriendListModel.shareSingleton.getUserModel()
        balanceLabel.text = String(format: "%.2f", (userModel?.balance) ?? 0)
        self.yuebaoLabel.text = self.userModel?.todayTransaction
        self.tableView.separatorStyle = .none
        
        let format = NumberFormatter()
        format.numberStyle = .decimal
        
        let str = format.string(from: NSNumber(value: (userModel?.balance) ?? 0.00))
        let spos = str?.index(of: ".")

        let strings : NSString = str! as NSString
        let deRange = strings.range(of: ".")
        if deRange.location == (str?.count)! - 2 {
            balanceLabel.text = (str ?? "0") + "0"
        }else {
            if spos == nil {
                balanceLabel.text = (str ?? "0") + ".00"
            }else{
                balanceLabel.text = str ?? "0"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goYuebaoBtn.layer.masksToBounds = true
        goYuebaoBtn.layer.cornerRadius = 2
        goYuebaoBtn.layer.borderWidth = 1
        goYuebaoBtn.layer.borderColor = UIColor(red: 144.0/255.0, green: 186.0/255.0, blue: 216.0/255.0, alpha: 1).cgColor
        //导航设置
//        setupNavBar()
        balanceLabel.adjustsFontSizeToFitWidth = true
        balanceLabel.font = UIFont(name: "Helvetica Neue", size: 64)
    }

    @IBAction func todayOnClick(_ sender: Any) {
        let editVC = XZEditUserInfoVC()
        editVC.textField.text = self.userModel?.todayTransaction
        editVC.postValueBlock = {  [weak  self] (value : String) in
            
            self?.userModel?.todayTransaction = value
            self?.yuebaoLabel.text = value
            let userModel = XZFriendListModel.shareSingleton.getUserModel()
            userModel?.todayTransaction = value
            XZFriendListModel.shareSingleton.addSelfUserModel(userModel!)
            let _ = XZFriendListModel.shareSingleton.saveSelfToDB()
        }
        editVC.navigationItem.title = "修改交易提示"
        
        self.navigationController?.pushViewController(editVC, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let withdrawalVC = UIStoryboard(name: "withDraw", bundle: nil).instantiateViewController(withIdentifier: "XZWithdrawalVC")
            self.navigationController?.pushViewController(withdrawalVC, animated: true)
        }
    }
}


//MARK:--UI相关
extension XZBalanceTabVC{
    
}
