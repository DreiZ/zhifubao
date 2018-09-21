//
//  XZMessageHelper.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/12.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMessageHelper: NSObject {
    
    //创建一条本地消息
    class func createMessageFrame(type : String, content : String,
                                  date : Date, path : String?, from : String,
                                  to : String, fileKey : String?,
                                  isSender : Bool, receivedSenderByYourself : Bool, voiceTime : Int?, isVoiceRead : Bool, transferMark : String?) -> XZMessageFrame {
        
        let message : XZMessage = XZMessage()
        message.to = to
        message.from = from
        message.type = type
        message.fileKey = fileKey
        message.date = Int(date.timeIntervalSinceReferenceDate)
        message.voiceTime = voiceTime ?? 1
        message.transferMark = transferMark
        message.isVoiceRead = isVoiceRead
        
        let model : XZMessageModel = XZMessageModel()

        
        if type == TypeText {
            message.content = content
        }else if type == TypePic {
            message.content = "[图片]"
        }else if type == TypeVoice {
            message.content = "[语音]"
        }else if type == TypeRedPacket || type == TypeRedPacketOpen {
            message.content = content
        }else if type == TypeTransfer {
            message.content = content
        }else if type == TypeTime {
            message.content = "[时间]"
        }else {
            message.content = content
        }
        
        model.isSender = isSender
        model.mediaPath = path
        
        if isSender {
            message.deliveryState = .delivering
        }else {
            message.deliveryState = .delivered
        }
        
        model.message = message
        
        let modleF = XZMessageFrame()
        modleF.setModel(model: model)
        
        return modleF
    }
    
    
    //创建一条时间消息
    class func createSystemTimeMessageFrame(content : String = "[时间]",
                                  date : Date, from : String,
                                  to : String, isSender : Bool, receivedSenderByYourself : Bool, systemTime : Date?) -> XZMessageFrame {
        
        let message : XZMessage = XZMessage()
        message.to = to
        message.from = from
        message.type = TypeTime
        message.systemTime = systemTime ?? Date()
        message.date = Int(date.timeIntervalSinceReferenceDate)
        
        let model : XZMessageModel = XZMessageModel()
        
        message.content = "[时间]"
        model.isSender = isSender

        
        if isSender {
            message.deliveryState = .delivering
        }else {
            message.deliveryState = .delivered
        }
        
        model.message = message
        
        let modleF = XZMessageFrame()
        modleF.setModel(model: model)
        
        return modleF
    }
    
    //创建一条系统消息
    class func createSystemMessageFrame(systemLeft : String, messageRight : String, systemImage : UIImage?,
                                            date : Date, from : String,
                                            to : String, isSender : Bool, receivedSenderByYourself : Bool) -> XZMessageFrame {
        
        let message : XZMessage = XZMessage()
        message.to = to
        message.from = from
        message.type = TypeSystem
        message.systemLeft = systemLeft
        message.systemRight = messageRight
        message.systemImage = systemImage
        message.date = Int(date.timeIntervalSinceReferenceDate)
        
        let model : XZMessageModel = XZMessageModel()
        
        message.content = "[系统]"
        model.isSender = isSender
        
        
        if isSender {
            message.deliveryState = .delivering
        }else {
            message.deliveryState = .delivered
        }
        
        model.message = message
        
        let modleF = XZMessageFrame()
        modleF.setModel(model: model)
        
        return modleF
    }
    
    //创建一条image消息
    class func createImageMessageFrame( image : UIImage?,
                                        date : Date, from : String,
                                        to : String, isSender : Bool, receivedSenderByYourself : Bool) -> XZMessageFrame {
        
        let message : XZMessage = XZMessage()
        message.to = to
        message.from = from
        message.type = TypePic
        message.image = image
        message.date = Int(date.timeIntervalSinceReferenceDate)
        
        let model : XZMessageModel = XZMessageModel()
        
        message.content = "[图片]"
        model.isSender = isSender
        
        
        if isSender {
            message.deliveryState = .delivering
        }else {
            message.deliveryState = .delivered
        }
        
        model.message = message
        
        let modleF = XZMessageFrame()
        modleF.setModel(model: model)
        
        return modleF
    }
    
    
    //MARK: -----------------相关方法-------------------------
    class func timeFormatWithDate(time : Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let currentDate = Date.init(timeIntervalSince1970: TimeInterval(time))
        let date = formatter.string(from: currentDate)
        
        return date
    }
    
    class func timeFormatWithDate2(time : Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy/MM/dd HH:mm"
        
        let currentDate = Date.init(timeIntervalSince1970: TimeInterval(time))
        let date = formatter.string(from: currentDate)
        
        return date
    }
    
    class func getTime(time : Int, format : String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let currentDate = Date.init(timeIntervalSince1970: TimeInterval(time))
        let date = formatter.string(from: currentDate)
        
        return date
    }
}
