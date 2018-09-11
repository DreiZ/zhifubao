//
//  XZChatConfig.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

let kLineColor : UIColor = UIColor.init(red: 226.0/255.0, green: 226.0/255.0, blue: 228.0/255.0, alpha: 1)
let kChatBackColor : UIColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1)
let kChatBoxBackColor : UIColor = UIColor.init(red: 245.0/245.0, green: 245.0/255.0, blue: 248.0/255.0, alpha: 1)


/**tabbar高度*/
let kTabBarHeight : CGFloat = (kWindowH == 812.0 ? (34 + 50) : 50)

let kChatMoreViewHeight : CGFloat = 180


let ICEmotionMaxRows : Int = 3
let ICEmotionMaxCols : Int = 7
let ICEmotionPageSize = ((ICEmotionMaxRows * ICEmotionMaxCols) - 1)

enum XZChatBoxStatus : String {
    case nothing = "默认状态"
    case showVoXZe = "录音状态"
    case showFace = "输入表情状态"
    case showMore = "显示“更多”页面状态"
    case showKeyboard = "正常键盘"
    case showVideo = "录制视频"
}

// 消息发送状态
enum MessageDeliveryState : Int {
    case pending = 0  // 待发送
    case delivering = 1   // 正在发送
    case delivered = 2    // 已发送，成功
    case failure = 3      // 发送失败
    case serviceFaid = 4   // 发送服务器失败(可能其它错,待扩展)
}

// 消息状态
enum XZMessageStatus : Int {
    case unRead = 0          // 消息未读
    case read = 1                 // 消息已读
    case back = 2                 // 消息撤回
}
