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

let HEIGHT_STATUSBAR : CGFloat   = 20;
let HEIGHT_NAVBAR : CGFloat      = 44;
let HEIGHT_CHATBOXVIEW : CGFloat = 215;

let kChatMoreViewHeight : CGFloat = 180


let ICEmotionMaxRows : Int = 3
let ICEmotionMaxCols : Int = 7
let ICEmotionPageSize = ((ICEmotionMaxRows * ICEmotionMaxCols) - 1)

let MessageHeadWidth : CGFloat = 40
let MessageHeadToView : CGFloat = 10
let MessageHeadToBubble : CGFloat = 6
let MessageLineSpacing : CGFloat = 4
let MessageRedViewWidth : CGFloat = 8
let MessageVoiceSpacing : CGFloat = 23
let MessageVoiceWidth : CGFloat = 12.5
let MessageVoiceHeight : CGFloat = 17

//信息聊天文字大小
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

//语音时间文字大小
var MessageVoiceFont : UIFont {
    var size : CGFloat = 10
    if kWindowW == 320 {
        size = 10
    }else if kWindowH == 812 {
        size = 10
    }else if kWindowW == 414 {
        size = 10
    }else if kWindowW == 375 {
        size = 10
    }
    return UIFont.systemFont(ofSize: size)
}

//系统时间文字大小
var MessageTimeFont : UIFont {
    var size : CGFloat = 11
    if kWindowW == 320 {
        size = 11
    }else if kWindowH == 812 {
        size = 11
    }else if kWindowW == 414 {
        size = 11
    }else if kWindowW == 375 {
        size = 11
    }
    return UIFont.systemFont(ofSize: size)
}

//系统提示文字大小-（红包）
var MessageSystemFont : UIFont {
    var size : CGFloat = 14
    if kWindowW == 320 {
        size = 14
    }else if kWindowH == 812 {
        size = 14
    }else if kWindowW == 414 {
        size = 14
    }else if kWindowW == 375 {
        size = 14
    }
    return UIFont.systemFont(ofSize: size)
}

//MARK --------------------------------------
// 文字消息 上 space
var MessageTopSpace : CGFloat {
    var height : CGFloat = 10
    if kWindowW == 320 {
        height = 10
    }else if kWindowH == 812 {
        height = 8
    }else if kWindowW == 414 {
        height = 8
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
        height = 13
    }else if kWindowW == 414 {
        height = 13
    }else if kWindowW == 375 {
        height = 12
    }
    return height
}

//消息redpacket 上 space
var MessageRedTopSpace : CGFloat {
    var height : CGFloat = 10
    if kWindowW == 320 {
        height = 10
    }else if kWindowH == 812 {
        height = 9
    }else if kWindowW == 414 {
        height = 9
    }else if kWindowW == 375 {
        height = 10
    }
    return height
}

//消息下redpacket space
var MessageRedBottomSpace : CGFloat {
    var height : CGFloat = 12
    if kWindowW == 320 {
        height = 12
    }else if kWindowH == 812 {
        height = 13
    }else if kWindowW == 414 {
        height = 13
    }else if kWindowW == 375 {
        height = 12
    }
    return height
}

//系统时间 18-8 -37（414，812）   19-6-37（320，375）
var MessageSystemTimeHeight : CGFloat {
    var height : CGFloat = 18
    if kWindowW == 320 {
        height = 37
    }else if kWindowH == 812 {
        height = 37
    }else if kWindowW == 414 {
        height = 37
    }else if kWindowW == 375 {
        height = 37
    }
    return height
}

//系统时间 上边距
var MessageSystemTimeTopSpace : CGFloat {
    var height : CGFloat = 18
    if kWindowW == 320 {
        height = 18
    }else if kWindowH == 812 {
        height = 18
    }else if kWindowW == 414 {
        height = 18
    }else if kWindowW == 375 {
        height = 18
    }
    return height
}

//系统时间 下边距
var MessageSystemTimeBottom : CGFloat {
    var height : CGFloat = 8
    if kWindowW == 320 {
        height = 8
    }else if kWindowH == 812 {
        height = 8
    }else if kWindowW == 414 {
        height = 8
    }else if kWindowW == 375 {
        height = 8
    }
    return height
}

//系统消息 上边距
var MessageSystemTopSpace : CGFloat {
    var height : CGFloat = 9
    if kWindowW == 320 {
        height = 9
    }else if kWindowH == 812 {
        height = 9
    }else if kWindowW == 414 {
        height = 9
    }else if kWindowW == 375 {
        height = 9
    }
    return height
}

//系统消息 下边距
var MessageSystemBottomSpace : CGFloat {
    var height : CGFloat = 10
    if kWindowW == 320 {
        height = 10
    }else if kWindowH == 812 {
        height = 12
    }else if kWindowW == 414 {
        height = 12
    }else if kWindowW == 375 {
        height = 10
    }
    return height
}

//系统消息内容高
var MessageSystemHeight : CGFloat {
    var height : CGFloat = 45
    if kWindowW == 320 {
        height = 26
    }else if kWindowH == 812 {
        height = 26
    }else if kWindowW == 414 {
        height = 26
    }else if kWindowW == 375 {
        height = 26
    }
    return height
}

//文字信息max width
var MessageMaxWidth : CGFloat {
    var width : CGFloat = 214
    if kWindowW == 320 {
        width = 214
    }else if kWindowH == 812 {
        width = 267
    }else if kWindowW == 414 {
        width = 267
    }else if kWindowW == 375 {
        width = 245
    }
    return width
}

//红包信息 height
var MessageRedHeight : CGFloat {
    var height : CGFloat = 214
    if kWindowW == 320 {
        height = 95
    }else if kWindowH == 812 {
        height = 95
    }else if kWindowW == 414 {
        height = 95
    }else if kWindowW == 375 {
        height = 95
    }
    return height
}

//信息voice max width
var MessageVoiceMaxWidth : CGFloat {
    var width : CGFloat = 214
    if kWindowW == 320 {
        width = 206
    }else if kWindowH == 812 {
        width = 244
    }else if kWindowW == 414 {
        width = 244
    }else if kWindowW == 375 {
        width = 230
    }
    return width
}


//信息voice min width
var MessageVoiceMinWidth : CGFloat {
    var width : CGFloat = 76
    if kWindowW == 320 {
        width = 76
    }else if kWindowH == 812 {
        width = 95
    }else if kWindowW == 414 {
        width = 95
    }else if kWindowW == 375 {
        width = 88
    }
    return width
}


//信息文字 margin
var MessageSystemMargin : CGFloat {
    var width : CGFloat = 11
    if kWindowW == 320 {
        width = 11
    }else if kWindowH == 812 {
        width = 11
    }else if kWindowW == 414 {
        width = 11
    }else if kWindowW == 375 {
        width = 11
    }
    return width
}

//信息arrow width
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

let RedView         = "GXRedView"
let TypeSystem      = "GXSystem"
let TypeText        = "GXText"
let TypeVoice       = "GXVoice"
let TypePic         = "GXPic"
let TypeTime        = "GXTime"

let MessageKey      = "GXMessageKey"
let VoiceIcon       = "GXVoiceIcon"
let TypeFile        = "GXFile"
let TypePicText     = "GXPicText"
let MessageTypeKey  = "GXMessageTypeKey"

//红包
let TypeRedPacket            = "TypeRedPacket"
let TypeRedPacketOpen        = "TypeRedPacketOpen"
//转账
let TypeTransfer            = "TypeTransfer"


let VideoPathKey    = "VideoPathKey"

let GXSelectEmotionKey = "GXSelectEmotionKey"

enum XZChatBoxStatus : String {
    case nothing = "默认状态"
    case showVoice = "录音状态"
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
    case read = 1            // 消息已读
    case back = 2            // 消息撤回
}



/************Notification*************/

let GXEmotionDidSelectNotification   = "GXEmotionDidSelectNotification"
let GXEmotionDidDeleteNotification   = "GXEmotionDidDeleteNotification"
let GXEmotionDidSendNotification     = "GXEmotionDidSendNotification"
//let NotificationReceiveUnreadMessage =
//    "NotificationReceiveUnreadMessage"
let NotificationDidCreatedConversation = "NotificationDidCreatedConversation"
let NotificationFirstMessage         = "NotificationFirstMessage"
let NotificationDidUpdateDeliver     = "NotificationDidUpdateDeliver"
let NotificationPushDidReceived      = "NotificationPushDidReceived"
let NotificationDeliverChanged       = "NotificationDeliverChanged"
let NotificationBackMsgNotification  = "NotificationBackMsgNotification"
let NotificationGPhotoDidChanged     = "NotificationGPhotoDidChanged"

let NotificationReloadDataIMSource   = "NotificationReloadDataIMSource"
let NotificationUserHeadImgChangedNotification  = "NotificationUserHeadImgChangedNotification"
let NotificationKickUserNotification     = "NotificationKickUserNotification"
let NotificationShareExitNotification = "NotificationShareExitNotification"
let ICShareCancelNotification = "ICShareCancelNotification"
let ICShareConfirmNotification = "ICShareConfirmNotification"
let ICShareStayInAppNotification = "ICShareStayInAppNotification"
let ICShareBackOtherAppNotification = "ICShareBackOtherAppNotification"
