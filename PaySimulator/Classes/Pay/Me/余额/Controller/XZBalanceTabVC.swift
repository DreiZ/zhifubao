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
        
        self.tableView.separatorStyle = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goYuebaoBtn.layer.masksToBounds = true
        goYuebaoBtn.layer.cornerRadius = 2
        goYuebaoBtn.layer.borderWidth = 1
        goYuebaoBtn.layer.borderColor = UIColor(red: 144.0/255.0, green: 186.0/255.0, blue: 216.0/255.0, alpha: 1).cgColor
        //导航设置
//        setupNavBar()
        
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
    
//    private func setupNavBar(){
//        self.navigationController?.navigationBar.barTintColor = ddBlueColor()
//
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize:18)];
//        self.navigationController?.navigationBar.isTranslucent = false;//不透明
//    }
    
}
