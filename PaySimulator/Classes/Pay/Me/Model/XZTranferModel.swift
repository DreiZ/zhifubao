//
//  XZTranferModel.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/26.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZTranferModel: NSObject {
    var toUser : XZUserModel?
    //订单号
    var billNo : String?
    
    var billType : String?
    //true：转入 false：转出
    var isTransferIn : Bool = true
    //金额
    var amount : String = ""
    //收款备注
    var mark : String?
    
    //收款方式 0：余额 1：余额宝 2：银行卡
    var paymentMethod : String = "余额"
    //账单分类
    var billClass : String = "其他"
    //创建时间
    var createTime : Date?
    //0:交易成功 1：待付款
    var state : String = "交易成功"
}
