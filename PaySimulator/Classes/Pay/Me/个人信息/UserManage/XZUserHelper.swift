//
//  XZUserHelper.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/3.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZUserHelper: NSObject {

    //MARK:--用户属性
    var iconImage :  String?
    var userName :   String?
    var payAccount : String?
    var VIPLevel :   String?
  
//MARK:--用户信息单利
    class var sharedUserHelper : XZUserHelper {
        struct userHelper {
            static let userHelper = XZUserHelper()
        }
        return userHelper.userHelper;
    }
    
   
}
//MARK:--归档解档
extension XZUserHelper {
    
     func getUserInfo() -> XZUserHelper {
        let userDefaut = UserDefaults.standard
        XZUserHelper.sharedUserHelper.iconImage = userDefaut.object(forKey: "iconImage") as? String
        XZUserHelper.sharedUserHelper.userName = userDefaut.object(forKey: "userName") as? String
        XZUserHelper.sharedUserHelper.payAccount = userDefaut.object(forKey: "payAccount") as? String
        XZUserHelper.sharedUserHelper.VIPLevel = userDefaut.object(forKey: "VIPLevel") as? String
        return XZUserHelper.sharedUserHelper
    }
    
    func savrUserInfo() {
        let userDefaut = UserDefaults.standard
       
        userDefaut.set(self.iconImage, forKey: "iconImage")
        userDefaut.set(self.userName, forKey: "userName")
        userDefaut.set(self.payAccount, forKey: "payAccount")
        userDefaut.set(self.VIPLevel, forKey: "VIPLevel")
        userDefaut.synchronize()
    }
    
    
    
    
}
