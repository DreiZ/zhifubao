//
//  XZCommon.swift
//  DouYuZB
//
//  Created by 再出发 on 2018/8/23.
//  Copyright © 2018年 sha xianding. All rights reserved.
//

import Foundation
import UIKit

let kStatusBarH : CGFloat = 20;
let kNavigationBarH : CGFloat = 44;

/**以5s为标准*/
let currentPX : CGFloat = 640;

//屏幕宽度
let kWindowW :  CGFloat  = UIScreen.main.bounds.size.width;
//屏幕高度
let kWindowH :  CGFloat  = UIScreen.main.bounds.size.height;
/**顶部位置*/
let DDSafeAreaTopHeight : CGFloat = (kWindowH == 812.0 ? 88 :64 )

/**底部位置*/
let DDSafeAreaBottomHeight : CGFloat = (kWindowH == 812.0 ? 34 : 0 )
/**tabbar高度*/
let DDTabBarHeight : CGFloat = (kWindowH == 812.0 ? (34 + 44) : 44)

/**app版本号*/
let kAPPVersion = (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)




/**等比缩放frame*/
func DDFRAME(x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat) -> CGRect{
    
    return CGRect(x: x*(kWindowW/currentPX), y: y*(kWindowW/currentPX), width: w*(kWindowW/currentPX), height: h*(kWindowW/currentPX))
}
/**随机颜色*/
func ddRandomColor() -> UIColor {
    return UIColor(red:CGFloat(arc4random_uniform(255))/255.0, green: CGFloat(arc4random_uniform(255))/255.0, blue: CGFloat(arc4random_uniform(255))/255.0, alpha: 1)
}
/**颜色*/
func ddColor(_ R:CGFloat ,_ G:CGFloat ,_ B:CGFloat) -> UIColor {
    return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1)
}
/**颜色*/
func ddColorA(_ r:CGFloat ,_ g:CGFloat ,_ b:CGFloat,_ a : CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a/255.0)
}


/**比例值*/
func ddSpacing(_ x:CGFloat) ->(CGFloat) {
    
    return x*(kWindowW/currentPX);
}


//打印
//public func print(_ items: Any..., separator: String = default, terminator: String = default)
func DDLog  (_ Log: Any...,file : String = #file, lineNumber : Int = #line ){
    #if DEBUG
    
    let fileName = (file as NSString).lastPathComponent
//    let method : String = #function
    
    print("[\(Date()) \(fileName):- line:\(lineNumber)] - \(Log)" )
    
    #endif
    
   
    
}


