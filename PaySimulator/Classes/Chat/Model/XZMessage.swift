//
//  XZMessage.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMessage: NSObject {
    
    // 消息来源用户名
    var senderName : String?
    // 消息来源用户id
    var from : String?
    // 消息目的地群组id
    var to : String?
    
    var fromImage : UIImage?
    // 消息目的地群组id
    var toImage : UIImage?
    
    // 消息ID
    var messageId : String?
    // 消息发送状态
    var deliveryState : MessageDeliveryState = MessageDeliveryState.pending
    // 消息时间
    var date : Int?
    // 本地消息标识:(消息+时间)的MD5
    var localMsgId : String?
    // 消息文本内容
    var content : String?
    // 音频文件的fileKey
    var fileKey : String?
    // 音频文件的秒数
    var voiceTime : Int = 1
    // 音频文件的秒数
    var isVoiceRead : Bool = false
    // 显示系统时间
    var systemTime : Date = Date()
    // image
    var image : UIImage?
    // transfer
    var transferMark : String?
    
    // 显示消息左侧提示
    var systemLeft : String?
    // 显示消息右侧提示
    var systemRight : String?
    // 显示系统消息 image
    var systemImage : UIImage?
    
    // 发送消息对应的type类型:1,2,3
    var type : String?
    // 时长，宽高，首帧id
    var lnk : String?
    
    // (0:未读 1:已读 2:撤回)
    var status : XZMessageStatus = XZMessageStatus.unRead
}
