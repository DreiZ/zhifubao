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
    
    class func dropTable() {
        XZFriendListModel.dropTable()
        XZUserModel.dropTable()
        XZChatModel.dropTable()
        XZChatListModel.dropTable()
        XZMessage.dropTable()
    }
    
    func test () {
        //let globalHelper = XZBaseModel.getUsingLKDBHelper()
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

/*
func test() {
    self.add("示例 开始 example start \n\n")
    let globalHelper = LKTest.getUsingLKDBHelper()
    
    ///删除所有表   delete all table
    globalHelper.dropAllTable()
    
    //清空表数据  clear table data
    LKDBHelper.clearTableData(LKTest.self)
    
    //初始化数据模型  init object
    let test = LKTest.init();
    
    test.name = "zhan san"
    test.age = 16
    test.url = URL(string: "http://zzzz");
    
    //外键  foreign key
    let foreign = LKTestForeign.init()
    foreign.address = ":asdasdasdsadasdsdas"
    foreign.postcode = 123341
    foreign.addid = 213.12312
    
    test.address = foreign
    
    test.blah = ["0",[1],["2":2],foreign]
    test.hoho = ["array":test.blah!,"foreign":foreign,"normal":123456,"date":NSDate()]
    
    test.isGirl = true
    
    test.like = 56
    test.img = UIImage.init(named: "Snip20130620_6.png")
    test.color = UIColor.orange
    //同步 插入第一条 数据   synchronous insert the first
    test.saveToDB()
    
    //更改主键继续插入   Insert the change after the primary key
    test.name = "li si"
    test.saveToDB()
    
    //事物  transaction
    globalHelper.execute { (_helper) -> Bool in
        let helper = _helper
        test.name = "1"
        var insertSucceed = helper.insert(toDB: test);
        
        test.name = "2"
        insertSucceed = helper.insert(toDB: test);
        
        test.name = "1"
        test.rowid = 0
        insertSucceed = helper.insert(toDB: test);
        
        if insertSucceed == false {
            return false
        }
        else {
            return true
        }
    }
    
    self.add("同步插入 完成!  Insert completed synchronization")
    
    sleep(1);
    
    let searchResultArray = LKTest.search(withWhere: nil, orderBy: nil, offset: 0, count: 0);
    for obj in searchResultArray! {
        self.add((obj as AnyObject).printAllPropertys())
    }
}
}
*/

