//
//  AppDelegate.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/29.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupKeyBoardConfig()//键盘第三方
        return true
    }

    
    func setupKeyBoardConfig(){
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
    }
    

    class func app () -> AppDelegate  {
        return UIApplication.shared.delegate as! AppDelegate
    }
}



