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

let MessageHeadWidth : CGFloat = 40
let MessageHeadToView : CGFloat = 10

//信息主要文字大小
var MessageFont : UIFont {
    var size : CGFloat = 15
    if kWindowW == 320 {
        size = 15
    }else if kWindowH == 812 {
        size = 15
    }else if kWindowW == 414 {
        size = 15
    }else if kWindowW == 375 {
        size = 15
    }
    return UIFont.systemFont(ofSize: size)
}

var MessageSubFont : UIFont {
    var size : CGFloat = 12
    if kWindowW == 320 {
        size = 12
    }else if kWindowH == 812 {
        size = 12
    }else if kWindowW == 414 {
        size = 12
    }else if kWindowW == 375 {
        size = 12
    }
    return UIFont.systemFont(ofSize: size)
}

//消息 上 space
var MessageTopSpace : CGFloat {
    var height : CGFloat = 10
    if kWindowW == 320 {
        height = 10
    }else if kWindowH == 812 {
        height = 8
    }else if kWindowW == 414 {
        height = 7
    }else if kWindowW == 375 {
        height = 10
    }
    return height
}

//消息下 space
var MessageBottomSpace : CGFloat {
    var height : CGFloat = 12
    if kWindowW == 320 {
        height = 12
    }else if kWindowH == 812 {
        height = 14
    }else if kWindowW == 414 {
        height = 12
    }else if kWindowW == 375 {
        height = 12
    }
    return height
}

//系统时间
var MessageSystemTimeHeight : CGFloat {
    var height : CGFloat = 26
    if kWindowW == 320 {
        height = 26
    }else if kWindowH == 812 {
        height = 30
    }else if kWindowW == 414 {
        height = 27
    }else if kWindowW == 375 {
        height = 26
    }
    return height
}

//系统消息
var MessageSystemHeight : CGFloat {
    var height : CGFloat = 45
    if kWindowW == 320 {
        height = 45
    }else if kWindowH == 812 {
        height = 150.0 / 1125.0 * kWindowW
    }else if kWindowW == 414 {
        height = 132.0 / 1242.0 * kWindowW
    }else if kWindowW == 375 {
        height = 45
    }
    return height
}

//信息max width
var MessageMaxWidth : CGFloat {
    var height : CGFloat = 214
    if kWindowW == 320 {
        height = 214
    }else if kWindowH == 812 {
        height = 261
    }else if kWindowW == 414 {
        height = 261
    }else if kWindowW == 375 {
        height = 245
    }
    return height
}

//信息margin
var MessageSystemMargin : CGFloat {
    var width : CGFloat = 11
    if kWindowW == 320 {
        width = 11
    }else if kWindowH == 812 {
        width = 12
    }else if kWindowW == 414 {
        width = 11
    }else if kWindowW == 375 {
        width = 12
    }
    return width
}

//信息margin
var MessageSystemArrowWidth : CGFloat {
    var width : CGFloat = 6
    if kWindowW == 320 {
        width = 6
    }else if kWindowH == 812 {
        width = 7
    }else if kWindowW == 414 {
        width = 6
    }else if kWindowW == 375 {
        width = 8
    }
    return width
}


//let MessageFont : UIFont =  UIFont.systemFont(ofSize: 16)


let MessageKey      = "GXMessageKey";
let VoiceIcon       = "GXVoiceIcon";
let RedView         = "GXRedView";
let TypeSystem      = "GXSystem";
let TypeText        = "GXText";
let TypeVoice       = "GXVoice";
let TypePic         = "GXPic";
let TypeVideo       = "GXVideo";
let TypeFile        = "GXFile";
let TypePicText     = "GXPicText";
let MessageTypeKey  = "GXMessageTypeKey";

//红包
let TypeRedPacket            = "TypeRedPacket";
let TypeRedPacketOpen        = "TypeRedPacketOpen";
//转账
let TypeTransfer            = "TypeTransfer";


let VideoPathKey    = "VideoPathKey";

let GXSelectEmotionKey = "GXSelectEmotionKey";

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
