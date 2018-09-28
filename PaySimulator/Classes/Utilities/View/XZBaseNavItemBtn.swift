//
//  XZBaseNavItemBtn.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/4.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBaseNavItemBtn: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    //便利构造函数
    convenience  init(frame: CGRect ,imgName:String = "",titleName:String = "") {
        
        self.init()
        self.frame = frame;
        if imgName != "" {
            self.setImage(UIImage(named: imgName), for: .normal)
            
        }
        if titleName != "" {
            self.setTitle(titleName, for: .normal)
        }
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15);
        
        
    }
    

}
