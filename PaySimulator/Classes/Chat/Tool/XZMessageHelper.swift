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
    func createMessageFrame(type : String, content : String,
                            date : Date, path : String, from : String,
                            to : String, fileKey : String,
                            isSender : Bool, receivedSenderByYourself : Bool) -> XZMessageFrame {
        let message : XZMessage = XZMessage()
        message.to = to
        message.from = from
        message.fileKey = fileKey
        message.date = Int(date.timeIntervalSinceReferenceDate)
        
        let model : XZMessageModel = XZMessageModel()
        let mtype = self.cellType(messageType: type)
        message.type = mtype
        
        if type == TypeText {
            message.content = content
        }else if type == TypePic {
            message.content = "[图片]"
        }else if type == TypeVoice {
            message.content = "[语音]"
        }else if type == TypeRedPacket {
            message.content = "[红包]"
        }else if type == TypeTransfer {
            message.content = "[转账]"
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
        modleF.model = model
        
        return modleF
    }
    
    func createMessageMeReceiverFrame(type : String, content : String, path : String, from : String, fileKey : String) -> XZMessageFrame {
        let message : XZMessage = XZMessage()
        message.type = type
        
        let model : XZMessageModel = XZMessageModel()
        message.fileKey = fileKey
        model.isSender = false
        message.content = content
        model.mediaPath = path
        message.deliveryState = .delivered
        model.message = message
        
        let modelF : XZMessageFrame = XZMessageFrame()
        modelF.model = model
        
        return modelF
    }
    
    
    func createTimeMessageFrame(type : String, content : String,
                                date : Date, path : String, from : String,
                                to : String, fileKey : String,
                                isSender : Bool, receivedSenderByYourself : Bool) -> XZMessageFrame {
        let message : XZMessage = XZMessage()
        message.to = to
        message.from = from
        message.fileKey = fileKey
        message.date = Int(date.timeIntervalSinceReferenceDate)
        
        let model : XZMessageModel = XZMessageModel()
        let mtype = self.cellType(messageType: type)
        message.type = mtype
        
        if type == TypeText {
            message.content = content
        }else if type == TypePic {
            message.content = "[图片]"
        }else if type == TypeVoice {
            message.content = "[语音]"
        }else if type == TypeRedPacket {
            message.content = "[红包]"
        }else if type == TypeTransfer {
            message.content = "[转账]"
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
        modleF.model = model
        
        return modleF
    }
    
    func createSendMessage(type : String, content : String, fileKey : String, date : Date,
                           from : String, to : String, lnk : String, status : String) -> XZMessage {
        let message : XZMessage = XZMessage()
        message.from = from
        message.to = to
        message.content = content
        message.fileKey = fileKey
        message.lnk = lnk
        message.date = Int(date.timeIntervalSinceReferenceDate)
        
        if type == TypeText {
            message.type = "1"
        }
        else if type == TypePic {
            message.type = "3"
        }
        else if type == TypeVoice {
            message.type = "2"
        }
        else if type == TypeRedPacket {
            message.type = "4"
        }
        else if type == TypeTransfer {
            message.type = "5"
        }
        else  {
            message.type = "6"
        }
        
        return message
    }
    
    func cellType(messageType : String) -> String {
        if (messageType == "1") {
            return TypeText;
        } else if (messageType == "2") {
            return TypeVoice;
        } else if (messageType == "3") {
            return TypePic;
        } else if (messageType == "4") {
            return TypeVideo;
        } else if (messageType == "5") {
            return TypeFile;
        } else {
            return messageType;
        }
    }
    
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
}
