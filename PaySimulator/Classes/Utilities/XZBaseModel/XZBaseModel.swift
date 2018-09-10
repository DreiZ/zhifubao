//
//  XZBaseModel.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/8.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

//存数数据示例
//Swift 4 中苹果修改了自动添加 @objc 的逻辑：一个继承 NSObject 的 swift 类不再默认给所有函数添加 @objc。只在实现 OC 接口和重写 OC 方法时才自动给函数添加 @objc 标识。
@objcMembers class XZBaseModel: NSObject {
    
    
    override static func getPrimaryKey() -> String {
        return "keyName"
    }
    
    override static func getTableName() -> String {
        return "tableName"
    }
    
    
//    override var description: String {
//        return "属性1:\(属性1) 属性2:\(属性2)";
//    }
}

extension XZBaseModel {
    func test () {
        let globalHelper = XZBaseModel.getUsingLKDBHelper()
        var tesxt = XZBaseModel()
        tesxt.updateToDB()
        /////删除所有表   delete all table
        //globalHelper.dropAllTable()
        //
        ////清空表数据  clear table data
        //LKDBHelper.clearTableData(XZBaseModel.self)
        
        //事物  transaction
//        globalHelper.execute { (_helper) -> Bool in
//            let helper = _helper
//            test.name = "1z2z3z"
//            var insertSucceed = helper.insert(toDB: test);
//            
//            test.name = "2"
//            insertSucceed = helper.insert(toDB: test);
//            
//            test.name = "1"
//            test.rowid = 0
//            insertSucceed = helper.insert(toDB: test);
//            //
//            if insertSucceed == false {
//                return false
//            }
//            else {
//                return true
//            }
//        }
    }
}



