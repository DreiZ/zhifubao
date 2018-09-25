//
//  XZChatModel.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/22.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
@objcMembers class XZChatModel : NSObject {
    //会话信息
    var messageList : [XZMessage] = []
    var toModel : XZUserModel?
    var fromModel : XZUserModel?
    var chatId : Int = 10001001
    
    
    override static func getPrimaryKey() -> String {
        return "chatId"
    }
    
    override static func getTableName() -> String {
        return "XZChatModel"
    }
    
//    override static func getPrimaryKey() -> String {
//        return "chatId"
//    }
    
//    override static func getTableName() -> String {
//        return "XZChatModel"
//    }
    
//    private override init(){
//        super.init()
//        print("zzz --- init ")
//    }
    
    class func dropTable () {
        let globalHelper = XZChatModel.getUsingLKDBHelper()
        ///删除所有表   delete all table
        globalHelper.dropAllTable()
    }
}
