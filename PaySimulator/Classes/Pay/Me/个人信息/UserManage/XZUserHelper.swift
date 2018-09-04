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
    
        class func getUserInfo() -> XZUserHelper {
        let userDefaut = UserDefaults.standard
        let user =  XZUserHelper.sharedUserHelper
        user.iconImage = userDefaut.object(forKey: "iconImage") as? String
        user.userName = userDefaut.object(forKey: "userName") as? String
        user.payAccount = userDefaut.object(forKey: "payAccount") as? String
        user.VIPLevel = userDefaut.object(forKey: "VIPLevel") as? String
        return user
    }
    
        func savrUserInfo() {
        let userDefaut = UserDefaults.standard
        let user =  XZUserHelper.sharedUserHelper
        userDefaut.set(user.iconImage, forKey: "iconImage")
        userDefaut.set(user.userName, forKey: "userName")
        userDefaut.set(user.payAccount, forKey: "payAccount")
        userDefaut.set(user.VIPLevel, forKey: "VIPLevel")
        userDefaut.synchronize()
    }
    
    
    
    
}
