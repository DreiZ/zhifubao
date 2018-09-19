//
//  XZAddressBookModel.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

@objcMembers class XZAddressBookModel: NSObject {

    
    @objc var username = ""
    @objc var headerImage = ""
    @objc var userid = ""
    @objc var acapital = ""
    
    
    init(dic:[String :  NSObject]) {
        super.init()
        setValuesForKeys(dic)
        
    }
    
 
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        if key == "userid" {
//            userId = value as! String
//        }
//
//        if key == "username" {
//            userName = value as! String
//        }
    }
    
    
    
}


