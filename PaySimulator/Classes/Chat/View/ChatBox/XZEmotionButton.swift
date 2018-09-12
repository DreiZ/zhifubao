//
//  XZEmotionButton.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZEmotionButton: UIButton {

    var emotion : XZEmotion?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        self.adjustsImageWhenHighlighted = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setEmotion(_ emotion : XZEmotion) {
        self.emotion = emotion
        self.setImage(UIImage(named: (self.emotion?.emotionId)!), for:.normal)
    }
    
}

