//
//  XZTopUpVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZTopUpVC: XZBaseViewController {

    
    //MARK:--storyBoard属性
    
    @IBOutlet weak var moneyTextField: UITextField!
    
    @IBAction func nexBtn(_ sender: UIButton) {
        
        let userModel = XZFriendListModel.shareSingleton.getUserModel()
        userModel?.balance += Double(self.moneyTextField.text ?? "0") ?? 0.0
        XZFriendListModel.shareSingleton.addSelfUserModel(userModel!)
        let _ = XZFriendListModel.shareSingleton.saveSelfToDB()

        let payMeStoryBoard = UIStoryboard(name: "PayMe", bundle: nil)
        //identifier获取指定的界面（VC）
        let topUpFinishVC = payMeStoryBoard.instantiateViewController(withIdentifier: "XZTopUpFinishVC") as! XZTopUpFinishVC
        topUpFinishVC.moneyStr = self.moneyTextField.text ?? ""
 
        self.navigationController?.pushViewController(topUpFinishVC, animated: true) 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyTextField.keyboardType = UIKeyboardType.decimalPad
    }

    func setupNavBar() {
        self.navBar.title = "充值"
        navigationItem.title = "充值"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .default
    }
}
