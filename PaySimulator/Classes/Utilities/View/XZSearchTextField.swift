//
//  XZSearchTextField.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZSearchTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        super.awakeFromNib()
        self.leftView = UIImageView(image: UIImage(named: "icon_sousuo"))
        self.leftViewMode = .always
        
//        self.leftView?.backgroundColor = ddRandomColor()
    }
    
    //改变图片与textField最左边的距离
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x = 8;
        return rect
        
    }
    
    //改变图片与textField文字的距离
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        rect.origin.x = 25;
        return rect
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.textRect(forBounds: bounds)
        rect.origin.x = 25;
        return rect
    }
    
    
    
    
}
