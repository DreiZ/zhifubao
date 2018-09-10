//
//  XZChatConfig.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

let kLineColor : UIColor = UIColor.init(red: 226.0/255.0, green: 226.0/255.0, blue: 228.0/255.0, alpha: 1)
/**tabbar高度*/
let kTabBarHeight : CGFloat = (kWindowH == 812.0 ? (34 + 50) : 50)

let kChatMoreViewHeight : CGFloat = 180

enum XZChatBoxStatus : String {
    case nothing = "默认状态"
    case showVoXZe = "录音状态"
    case showFace = "输入表情状态"
    case showMore = "显示“更多”页面状态"
    case showKeyboard = "正常键盘"
    case showVideo = "录制视频"
}
