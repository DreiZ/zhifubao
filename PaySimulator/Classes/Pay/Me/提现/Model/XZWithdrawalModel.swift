//
//  XZWithdrawalModel.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/7.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

@objcMembers class XZWithdrawalModel : NSObject{
    //定义属性
    var bankName : String = ""//银行名称
    var tailNum  : String = ""//尾号后四位
    var cardUserName : String = "" //持卡人姓名
    var money    : String = ""//提现金额
    var creatTime : String = ""//创建时间
    var endTime   : String = ""//结束时间
    var orderNum  : String = ""//订单编号
    
    
    init(withDarwalDict:[String:String]) {
        super.init()
        setValuesForKeys(withDarwalDict)
        
    }
 
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
