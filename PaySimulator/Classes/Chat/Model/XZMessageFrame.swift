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
    
    /// 系统 frame
    var systemViewF : CGRect?
}

extension XZMessageFrame {
    func setModel (model : XZMessageModel) {
        self.model = model
        
        let chatLabelMax = MessageMaxWidth - MessageSystemMargin * 2 - MessageSystemArrowWidth
        
        if model.isSender {
            let headX : CGFloat = kWindowW - MessageHeadWidth - MessageHeadToView
            headImageViewF = CGRect(x: headX, y: MessageTopSpace, width: MessageHeadWidth, height: MessageHeadWidth)
            
            if model.message?.type == TypeText {
                let chatLabelSize : CGSize = self.size(message: (model.message?.content) ?? "", maxWidth: chatLabelMax, font: MessageFont)
                let bubbleSize : CGSize = CGSize(width: chatLabelSize.width + MessageSystemMargin * 2 + MessageSystemArrowWidth, height: chatLabelSize.height + MessageSystemMargin * 2.0)

                bubbleViewF = CGRect(x: headX - bubbleSize.width - MessageHeadToBubble, y: MessageTopSpace, width: bubbleSize.width, height: bubbleSize.height - MessageLineSpacing)
                chatLabelF = CGRect(x: (bubbleViewF?.origin.x)! + MessageSystemMargin, y: (bubbleViewF?.origin.y)! + MessageSystemMargin - MessageLineSpacing/2.0, width: chatLabelSize.width, height: chatLabelSize.height+2)
                
                cellHight = (bubbleViewF?.size.height)! + MessageBottomSpace + MessageTopSpace
            }else if model.message?.type == TypeVoice {
                let chatVoiceLabelSize : CGSize = self.size(message: (String((model.message?.voiceTime) ?? 1) + "''"), maxWidth: chatLabelMax, font: MessageVoiceFont)
                
                let voiceLength = (MessageVoiceMaxWidth - MessageVoiceMinWidth)/59.0 * CGFloat((model.message?.voiceTime)! - 1) + MessageVoiceMinWidth + MessageSystemArrowWidth
                
                bubbleViewF = CGRect(x: headX - voiceLength - MessageHeadToBubble, y: MessageTopSpace, width: voiceLength, height: MessageHeadWidth)
                durationLabelF = CGRect(x: (bubbleViewF?.origin.x)! - 10 - chatVoiceLabelSize.width, y: (bubbleViewF?.origin.y)! + (bubbleViewF?.size.height)!/2.0, width: chatVoiceLabelSize.width, height: 12)
                voiceIconF = CGRect(x:  headX - MessageHeadToBubble - MessageVoiceSpacing - MessageVoiceWidth, y: (bubbleViewF?.origin.y)! + (MessageHeadWidth - MessageVoiceHeight)/2.0, width: MessageVoiceWidth, height: MessageVoiceHeight)
                
                cellHight = (bubbleViewF?.size.height)! + MessageBottomSpace + MessageTopSpace
            }else if model.message?.type == TypeTime {
                bubbleViewF = CGRect(x: 0, y: 0, width: 0, height: 0)
                headImageViewF = CGRect(x: 0, y: 0, width: 0, height: 0)
                cellHight = MessageSystemTimeHeight
            }else if model.message?.type == TypeSystem {
                var message = ((model.message?.systemLeft) ?? "") + ((model.message?.systemRight) ?? "")
                if model.message?.systemImage != nil {
                    message = "图 " + message
                }
                let systemLabelSize : CGSize = self.size(message: message, maxWidth: chatLabelMax, font: MessageSystemFont)
                
                bubbleViewF = CGRect(x: 0, y: 0, width: 0, height: 0)
                headImageViewF = CGRect(x: 0, y: 0, width: 0, height: 0)
                systemViewF = CGRect(x: (kWindowW - systemLabelSize.width)/2.0, y: MessageSystemTopSpace, width: systemLabelSize.width, height: systemLabelSize.height)
                cellHight = MessageSystemHeight + MessageSystemTopSpace + MessageSystemBottomSpace
            }
            
            let activityX : CGFloat = bubbleViewF!.origin.x - 40
            let activityY : CGFloat = (bubbleViewF!.origin.y + bubbleViewF!.size.height)/2.0 - 5.0
            let activityW : CGFloat = 40.0;
            let activityH : CGFloat = 40.0;
            
            activityF = CGRect(x : activityX, y : activityY, width : activityW, height : activityH)
            
           
        }else {
            let headX : CGFloat = MessageHeadToView
            headImageViewF = CGRect(x: headX, y: MessageTopSpace, width: MessageHeadWidth, height: MessageHeadWidth)
            
            if model.message?.type == TypeText {
                let chatLabelSize : CGSize = self.size(message: (model.message?.content) ?? "", maxWidth: chatLabelMax, font: MessageFont)
                let bubbleSize : CGSize = CGSize(width: chatLabelSize.width + MessageSystemMargin * 2 + MessageSystemArrowWidth, height: chatLabelSize.height + MessageSystemMargin * 2.0)
                
                bubbleViewF = CGRect(x: headX + MessageHeadToBubble + MessageHeadWidth, y: MessageTopSpace, width: bubbleSize.width, height: bubbleSize.height - MessageLineSpacing)
                chatLabelF = CGRect(x: (bubbleViewF?.origin.x)! + MessageSystemMargin + MessageSystemArrowWidth, y: (bubbleViewF?.origin.y)! + MessageSystemMargin - MessageLineSpacing/2.0, width: chatLabelSize.width, height: chatLabelSize.height+2)
                
                cellHight = (bubbleViewF?.size.height)! + MessageBottomSpace + MessageTopSpace
            }else if model.message?.type == TypeVoice {
                let chatVoiceLabelSize : CGSize = self.size(message: (String((model.message?.voiceTime) ?? 1) + "''"), maxWidth: chatLabelMax, font: MessageVoiceFont)
                
                let voiceLength = (MessageVoiceMaxWidth - MessageVoiceMinWidth)/59.0 * CGFloat((model.message?.voiceTime)! - 1) + MessageVoiceMinWidth + MessageSystemArrowWidth
                
                bubbleViewF = CGRect(x: headX + MessageHeadToBubble + MessageHeadWidth, y: MessageTopSpace, width: voiceLength, height: MessageHeadWidth)
                durationLabelF = CGRect(x: (bubbleViewF?.origin.x)! + (bubbleViewF?.size.width)! + 10, y: (bubbleViewF?.origin.y)! + (bubbleViewF?.size.height)!/2.0, width: chatVoiceLabelSize.width + 2, height: 12)
                redViewF = CGRect(x: (durationLabelF?.origin.x)! + (durationLabelF?.size.width)! - MessageRedViewWidth - 2, y: (bubbleViewF?.origin.y)!, width: MessageRedViewWidth, height: MessageRedViewWidth)
                voiceIconF = CGRect(x: (bubbleViewF?.origin.x)! + MessageVoiceSpacing, y: (bubbleViewF?.origin.y)! +  (MessageHeadWidth - MessageVoiceHeight)/2.0, width: MessageVoiceWidth, height: MessageVoiceHeight)
                
                cellHight = (bubbleViewF?.size.height)! + MessageBottomSpace + MessageTopSpace
            }else if model.message?.type == TypeTime {
                headImageViewF = CGRect(x: 0, y: 0, width: 0, height: 0)
                cellHight = MessageSystemTimeHeight
            }
            
            let activityX : CGFloat = bubbleViewF!.origin.x + (bubbleViewF?.width)! + 40
            let activityY : CGFloat = (bubbleViewF!.origin.y + bubbleViewF!.size.height)/2.0 - 5.0
            let activityW : CGFloat = 40.0;
            let activityH : CGFloat = 40.0;
            
            activityF = CGRect(x : activityX, y : activityY, width : activityW, height : activityH)

        }
    }
}

extension XZMessageFrame {
    func size(message : String,  maxWidth : CGFloat, font : UIFont) -> CGSize {
        let maxSize : CGSize = CGSize(width: maxWidth, height: CGFloat(MAXFLOAT))
        
        let paragraphStyle : NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = MessageLineSpacing
        
//        attributeStr.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributeStr.length))
        
        let dict : Dictionary = [NSAttributedStringKey.font : font, NSAttributedStringKey.paragraphStyle : paragraphStyle]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect = self.replaceEmoji(message: message).boundingRect(with: maxSize, options: option, attributes: dict, context: nil)
        
        return CGSize(width: rect.size.width, height: rect.size.height)
    }
    
    func replaceEmoji(message : String) -> String {
            let attributeStr : NSMutableAttributedString = NSMutableAttributedString(string: message)
            let regRmj = "\\[[a-zA-Z0-9\\/\\u4e00-\\u9fa5]+\\]"
            
            
            guard let expression =  try? NSRegularExpression(pattern: regRmj, options: .caseInsensitive) else {
                return message
            }
            

            
            let resultArray = expression.matches(in: message, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSRange(message.startIndex..., in:message))
            
            var mutableArray : Array<[String:Any]> = []
            
            for match in resultArray {
                let range = match.range
                let subStr = (message as NSString).substring(with: range)
                let faceArr = XZFaceManager.emojiMEmotions
                
                for face in faceArr {
                    if face.shortCut == subStr {
                        let attach = NSTextAttachment()
                        attach.image = UIImage(named: face.emotionId!)

                        let imgStr = NSAttributedString(string: "替 ")
                        var imgDic : [String : Any] = [:]
                        imgDic["image"] = imgStr
                        imgDic["range"] = range
                        mutableArray.append(imgDic)
                    }
                }
            }
            
            
            for item in mutableArray.reversed() {
                let range = item["range"]
                let image = item["image"]
                
                attributeStr.replaceCharacters(in: range as! NSRange, with:
                    image as! NSAttributedString)
            }
            
            return attributeStr.string
        }
}









