//
//  XZMessageFrame.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMessageFrame: NSObject {
    
    //聊天信息的背景图
    var bubbleViewF : CGRect?
    
    //聊天信息label
    var chatLabelF : CGRect?
    
    //发送的菊花视图
    var activityF : CGRect?
    
    //重新发送按钮
    var retryButtonF : CGRect?
    
    // 头像
    var headImageViewF : CGRect?
    
    // topView   /***第一版***/
    var topViewF : CGRect?
    /// 图片
    var picViewF : CGRect?
    
    //计算总的高度
    var cellHight : CGFloat?
    
    /// 消息模型
    var model : XZMessageModel?
    
    /// 语音图标
    var voiceIconF : CGRect?
    
    /// 语音时长数字
    var durationLabelF : CGRect?
    
    /// 语音未读红点
    var redViewF : CGRect?
}
