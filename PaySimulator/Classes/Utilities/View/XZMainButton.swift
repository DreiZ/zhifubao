//
//  XZMainButton.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/29.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

 

class XZMainButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
//    override init(frame: CGRect) {
//        super.init(frame: frame);
//
//        configTitleLabel()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
         configTitleLabel()
    }

    
    func configTitleLabel(){
        titleLabel?.font = UIFont.systemFont(ofSize: ddSpacing(26))
        setTitleColor(UIColor.darkGray, for: .normal);
        titleLabel?.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.dd_y = dd_height * 0.2;
        imageView?.dd_height = dd_height * 0.4;
        imageView?.dd_width = imageView?.dd_height ?? dd_height * 0.4;
        imageView?.dd_centerX = dd_width/2;
        
        titleLabel?.dd_x = 0;
        titleLabel?.dd_y = (imageView?.dd_bottom)! + 3;
        titleLabel?.dd_width = dd_width;
        titleLabel?.dd_height = dd_height-(imageView?.dd_bottom)!

    }

    
}



