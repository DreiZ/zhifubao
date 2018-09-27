//
//  XZRedPacketModel.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/27.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

@objcMembers class XZRedPacketModel: NSObject {
    //发红包的人
    var toUser : XZUserModel?
    //领红包的人
    var fromUser : XZUserModel?
    //金额
    var amount : String?
    //备注
    var mark : String?
    //首发红包类型 true：收红包  false：发红包
    var isReceive : Bool = false
    //领红包时间
    var time : Date?
    //头像带+
    var isHeadHadAdd : Bool = false
}
