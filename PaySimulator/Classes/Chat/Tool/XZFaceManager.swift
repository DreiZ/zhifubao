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
        print(XZFaceManager.emojiMEmotions)
    }
}

