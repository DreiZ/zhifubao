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

extension XZMessageFrame {
    func setModel (model : XZMessageModel) {
        self.model = model
        
        let chatLabelMax = MessageMaxWidth - MessageSystemMargin * 2 - MessageSystemArrowWidth
        
        if model.isSender {
            let headX : CGFloat = kWindowW - MessageHeadWidth - MessageHeadToView
//            let cellMinW : CGFloat = MessageSystemArrowWidth + MessageSystemMargin * 2.0 + 20.0
            headImageViewF = CGRect(x: headX, y: MessageTopSpace, width: MessageHeadWidth, height: MessageHeadWidth)
            
            if model.message?.type == TypeText {
                let chatLabelSize : CGSize = self.size(message: (model.message?.content) ?? "", maxWidth: chatLabelMax, font: MessageFont)
                let bubbleSize : CGSize = CGSize(width: chatLabelSize.width + MessageSystemMargin * 2 + MessageSystemArrowWidth, height: chatLabelSize.height + MessageSystemMargin * 2.0)
//                let topViewSize : CGSize = CGSize(width: cellMinW + MessageSystemMargin * 2, height: MessageTopSpace)
                
                bubbleViewF = CGRect(x: kWindowW - bubbleSize.width, y: MessageTopSpace, width: bubbleSize.width, height: bubbleSize.height)
                chatLabelF = CGRect(x: (bubbleViewF?.origin.x)! + MessageSystemMargin, y: (bubbleViewF?.origin.y)! + MessageSystemMargin, width: chatLabelSize.width, height: chatLabelSize.height)
            }
            
            let activityX : CGFloat = bubbleViewF!.origin.x - 40
            let activityY : CGFloat = (bubbleViewF!.origin.y + bubbleViewF!.size.height)/2.0 - 5.0
            let activityW : CGFloat = 40.0;
            let activityH : CGFloat = 40.0;
            
            activityF = CGRect(x : activityX, y : activityY, width : activityW, height : activityH)
            
            cellHight = (bubbleViewF?.size.height)! + MessageBottomSpace
        }
    }
}

extension XZMessageFrame {
    func size(message : String,  maxWidth : CGFloat, font : UIFont) -> CGSize {
        let maxSize : CGSize = CGSize(width: maxWidth, height: CGFloat(MAXFLOAT))
        
        let dict : Dictionary = [NSAttributedStringKey.font : font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect = message.boundingRect(with: maxSize, options: option, attributes: dict, context: nil)
        
        return rect.size
    }
}






