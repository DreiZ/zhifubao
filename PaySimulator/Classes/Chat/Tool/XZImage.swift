//
//  XZImage.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/15.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

extension UIImage {
    class func imageWithColor(_ color : UIColor) -> UIImage? {
        if let ctx = UIGraphicsGetCurrentContext() {
            let rectangle = CGRect(x:0, y:0, width:512, height:512)
            ctx.setFillColor(color.cgColor)
            ctx.setStrokeColor(color.cgColor)
            ctx.setLineWidth(10)
            ctx.addRect(rectangle)
            ctx.drawPath(using: .fillStroke)
            let theImage = UIGraphicsGetImageFromCurrentImageContext()
            
            return theImage
        }
        
       return nil
    }
}
