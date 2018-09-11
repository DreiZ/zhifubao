//
//  XZMessageModel.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMessageModel: NSObject {
    // 后期重构把这个类可能要去掉--by:gxz
    
    // 是否是发送者
    var isSender : Bool = true
    
    var message : XZMessage? = nil
    
    // 包含voice，picture，video的路径;有大图时就是大图路径
    // 不用这些路径了，只用里面的名字重新组成路径
    var mediaPath : String? = nil
}
