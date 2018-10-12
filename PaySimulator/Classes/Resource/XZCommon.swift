//
//  XZCommon.swift
//  DouYuZB
//
//  Created by 再出发 on 2018/8/23.
//  Copyright © 2018年 sha xianding. All rights reserved.
//

import Foundation
import UIKit

let kStatusBarH : CGFloat = 20
let kNavigationBarH : CGFloat = 44

/**以5s为标准*/
let currentPX : CGFloat = 750

//屏幕宽度
let kWindowW :  CGFloat  = UIScreen.main.bounds.size.width
//屏幕高度
let kWindowH :  CGFloat  = UIScreen.main.bounds.size.height
/**顶部位置*/
let DDSafeAreaTopHeight : CGFloat = (kWindowW == 320 ? 54 : kWindowH == 812.0 ? 88 :64 )

/**底部位置*/
let DDSafeAreaBottomHeight : CGFloat = (kWindowH == 812.0 ? 34 : 0 )
/**tabbar高度*/
let DDTabBarHeight : CGFloat = (kWindowH == 812.0 ? (34 + 44) : 44)

/**app版本号*/
let kAPPVersion = (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)

/**默认一般文字大小*/
let kLabelFont : CGFloat = 14
/**tableView背景颜色*/
let ddTableColor = UIColor.groupTableViewBackground
/**16进制颜色转换*/

func ddColorFromHex(_ colorStr:String) -> UIColor {
    
    var color = UIColor.red
    var cStr : String = colorStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
    
    if cStr.hasPrefix("#") {
        let index = cStr.index(after: cStr.startIndex)
        cStr = cStr.substring(from: index)
        
 
//        'substring(from:)' is deprecated: Please use String slicing subscript with a 'partial range from' operator.
    }
    if cStr.characters.count != 6 {
        return UIColor.black
    }
    
    let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
    let rStr = cStr.substring(with: rRange)
    
    let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
    let gStr = cStr.substring(with: gRange)
    
    let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
    let bStr = cStr.substring(from: bIndex)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    Scanner(string: rStr).scanHexInt32(&r)
    Scanner(string: gStr).scanHexInt32(&g)
    Scanner(string: bStr).scanHexInt32(&b)
    
    color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    
    return color
}






/**等比缩放frame*/
func DDFRAME(x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat) -> CGRect{
    
    return CGRect(x: x*(kWindowW/currentPX), y: y*(kWindowW/currentPX), width: w*(kWindowW/currentPX), height: h*(kWindowW/currentPX))
}
/**随机颜色*/
func ddRandomColor() -> UIColor {
    return UIColor(red:CGFloat(arc4random_uniform(255))/255.0, green: CGFloat(arc4random_uniform(255))/255.0, blue: CGFloat(arc4random_uniform(255))/255.0, alpha: 1)
}
/**支付宝蓝色主题*/
func ddBlueColor () -> UIColor{
    
    return ddColor( 27.0, 130.0, 209.0);
 
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


/**判断手机号*/
func isPhoneNumber(phoneNumber:String) -> Bool {
    if phoneNumber.count == 0 {
        return false
    }
    let mobile = "^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|147)\\d{8}$"
    let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
    if regexMobile.evaluate(with: phoneNumber) == true {
        return true
    }else
    {
        return false
    }
}
/**判断邮编*/
func isZipCodeNumber(zipCodeNumber:String) -> Bool {
    if zipCodeNumber.count == 0 {
        return false
    }
    let zipCodeNumber = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let regexCodeNumber = NSPredicate(format: "SELF MATCHES %@",zipCodeNumber)
    if regexCodeNumber.evaluate(with: zipCodeNumber) == true {
        return true
    }else
    {
        return false
    }
}

/**邮箱验证*/
func isValidateEmail(emal:String) -> Bool {
    
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    
    let emailTest = NSPredicate.init(format: "SELF MATCHES %@", emailRegex)
    
    return emailTest.evaluate(with: emal)
    
}




