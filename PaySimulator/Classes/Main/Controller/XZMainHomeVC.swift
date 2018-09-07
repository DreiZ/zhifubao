//
//  XZMainHomeVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMainHomeVC: XZBaseVC {
    var mainModel = XZFModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("zzz - \(mainModel.name) , \(mainModel.smodel.warepon)")
        if XZPublicDataManager.shareSingleton.addOrUpdateModel(data: mainModel){
            print("存入成功")
        } else {
            print("存入失败")
        }
        
        let tempModel = XZPublicDataManager.shareSingleton.getDBModelData(modleClass: XZFModel.classForCoder() as! ZBaseModel.Type)
        if let sssm : XZFModel = tempModel as? XZFModel {
            print("zzz - \(sssm.name) , \(sssm.smodel.warepon)")
        }
        
        self.view.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
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
           
            break
        case 3://收款账单
            
            break
        case 4://红包
            
            break
        case 5://提现账单
            
            break
        default:
            break
        }
           DDLog(sender.tag)
    }
}
