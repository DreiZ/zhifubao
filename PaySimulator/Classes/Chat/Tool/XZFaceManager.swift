//
//  XZFaceManager.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
import SwiftyJSON


class XZFaceManager: NSObject {

    static var emojiEmotions : Array<JSON>?
    static var emojiMEmotions : Array<XZEmotion> = []
    
    class func sgetEmojiEmotion () -> Array<Any>? {
        if let file = Bundle.main.path(forResource: "info", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                let json = try JSON(data: data)
                //                XZFaceManager.emojiEmotions = json
                if json.type == .dictionary {
                    let tempDict : Dictionary = json.dictionary!
                    if (tempDict["emotions"] != nil){
                        let tempArr = tempDict["emotions"]
                        if tempArr?.type == .array {
                            if let tempArr : Array = tempArr?.array {
                               
                                XZFaceManager.emojiEmotions = tempArr
                            }
                        }
                    }
                }
            } catch {
                XZFaceManager.emojiEmotions = nil
            }
        } else {
            XZFaceManager.emojiEmotions = nil
        }
        
        XZFaceManager.transToModel()
        
        return XZFaceManager.emojiEmotions
    }
    
    
    class func transToModel ()  {
        if let tempArr = XZFaceManager.emojiEmotions {
            for json in tempArr {
                if json.type == .dictionary {
                    let tempDict : Dictionary = json.dictionary!
                    let model = XZEmotion()
                    if (tempDict["shortCut"] != nil){
                        let temp1 = tempDict["shortCut"]
                        if temp1?.type == .string {
                            model.shortCut = temp1?.string
                        }
                    }
                    
                    if (tempDict["emotionId"] != nil){
                        let temp2 = tempDict["emotionId"]
                        if temp2?.type == .string {
                            model.emotionId = temp2?.string
                        }
                    }
                    
                    
                    XZFaceManager.emojiMEmotions.append(model)
                }
            }
        }
    }
    
    
    class func transferMessageString(message : String, font : UIFont, lineHeight : CGFloat , isSender : Bool) -> NSMutableAttributedString {
        let attributeStr : NSMutableAttributedString = NSMutableAttributedString(string: message)
        let regRmj = "\\[[a-zA-Z0-9\\/\\u4e00-\\u9fa5]+\\]"

        
        guard let expression =  try? NSRegularExpression(pattern: regRmj, options: .caseInsensitive) else {
            return attributeStr
        }
        
        attributeStr.addAttribute(NSAttributedStringKey.font, value: font, range: NSRange(location: 0, length: attributeStr.length))
        if isSender {
            attributeStr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: attributeStr.length))
        }else {
            attributeStr.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 8.0/255.0, green: 4.0/255.0, blue: 4.0/255.0, alpha: 1), range: NSRange(location: 0, length: attributeStr.length))
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
                    attach.bounds = CGRect(x: 0, y: -4, width: lineHeight, height: lineHeight)
                    
                    let imgStr = NSAttributedString(attachment: attach)
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

        return attributeStr
    }
    
}
