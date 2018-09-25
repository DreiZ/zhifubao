//
//  XZMainHomeVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMainHomeVC: XZBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
        
        let isFirst = UserDefaults.standard.bool(forKey: "kIsFirstLoad")
        if !isFirst {
            self.setFirstUserData()
        }
    }

   
    
    //MARK:--storyboard按钮点击事件，按钮tag值已经在xib中添加 顺序 0～5
    @IBAction func clickMainButton(_ sender: XZMainButton) {
       
        switch sender.tag {
        case 0://支付宝模拟器
            
            let tabBarVC = XZPayMainTabBarVC();
            let  keyWindow = UIApplication.shared.keyWindow;
            keyWindow?.rootViewController = tabBarVC;
            
//            self.navigationController?.pushViewController(tabBarVC, animated: false);
            break
        case 1://转账
            let transfervc = UIStoryboard(name: "Bill", bundle: nil).instantiateViewController(withIdentifier: "XZReceivablesViewController") as? XZReceivablesViewController
            guard let transfer = transfervc else {
                return
            }
            transfer.editType = .Transfer
            self.navigationController?.pushViewController(transfer, animated: true)
            break
        case 2://余额
           let chatvc = XZChatViewController()
           chatvc.hidesBottomBarWhenPushed = true
           self.navigationController?.pushViewController(chatvc, animated: true)
            break
        case 3://收款账单
            let arr =  XZFaceManager.sgetEmojiEmotion()
            print(arr ?? "zzz")
            break
        case 4://红包
            XZChatListModel.dropTable()
            XZUserModel.dropTable()
            XZChatModel.dropTable()
            XZChatListModel.dropTable()
            XZMessage.dropTable()
            break
        case 5://提现账单
            
            
            
            
            break
        default:
            break
        }
           DDLog(sender.tag)
    }
    
    
    //MARK:--拦截跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWithDrawalVC" {//提现
            let tabVC = segue.destination as! XZWithdrawalVC
            tabVC.hidesBottomBarWhenPushed = true
            let backIetm = UIBarButtonItem()
            backIetm.title = "返回";
            navigationItem.backBarButtonItem = backIetm
//            navigationController?.pushViewController(tabVC, animated: true)
            
        }else if (segue.identifier == "pushRedpacket"){ //红包
            let redVC = segue.destination as! XZEditRedPacketViewController
            redVC.hidesBottomBarWhenPushed = true
        }
    }
    
}

extension XZMainHomeVC {
    func setFirstUserData() {
        let userModel : XZUserModel = XZUserModel()
        userModel.userId = 9999
        userModel.nickName = "支付宝"
        userModel.trueName = "支付宝"
        
        userModel.aliCount = "zcf@163.com"
        userModel.isHiddenTureName = false
        
        XZFriendListModel.shareSingleton.addSelfUserModel(userModel)
        let _ = XZFriendListModel.shareSingleton.saveSelfToDB()
        
        UserDefaults.standard.set(true, forKey: "kIsFirstLoad")
    }
}
