//
//  XZUserModel.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/20.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

@objcMembers class XZUserModel: NSObject {
    //user id
     var userId : Int = 1000
    //头像
     var headImage : UIImage?
    //昵称
    @objc var nickName : String?
    //真实姓名
     var trueName : String?
    //电话号码
     var tel : String?
    //是否隐藏真实姓名
     var isHiddenTureName : Bool = false
    //支付宝账号
     var aliCount : String?
    //会员等级 0：无 1：钻石会员 2：铂金会员 3：黄金会员 4：大众会员
     var level : Int = 0
    //首字母
    @objc var acapital : String?
    
    override static func getPrimaryKey() -> String {
        return "userId"
    }
    
    override static func getTableName() -> String {
        return "XZUserModel"
    }
    
//    init(dic:[String :  NSObject]) {
//        super.init()
//        setValuesForKeys(dic)
//    }
//    
//    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        
//    }
    class func dropTable () {
        let globalHelper = XZUserModel.getUsingLKDBHelper()
        ///删除所有表   delete all table
        globalHelper.dropAllTable()
    }
    
}
