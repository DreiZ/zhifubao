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
    var userId : Int?
    //头像
    var headImage : UIImage?
    //昵称
    var nickName : String?
    //真实姓名
    var trueName : String?
    //电话号码
    var tel : String?
    //是否隐藏真实姓名
    var isHiddenTureName : Bool = false
    //支付宝账号
    var aliCount : String?
    //会员等级
    var level : String?
    
    override static func getTableName() -> String {
        return "XZUserModel"
    }
}
