//
//  XZEmotionPageView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZEmotionPageView: UIView {

    var emotions : Array<XZEmotion> = []
    
    @objc func emotionBtnClicked()  {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let inset : CGFloat = 15.0;
        let btnW  = (self.frame.size.width - CGFloat(2*inset))/CGFloat(ICEmotionMaxCols);
        let btnH  = (self.frame.size.height - CGFloat(2*inset))/CGFloat(ICEmotionMaxRows);
        
        var i = 0
        for _ in emotions {
            let btn : XZEmotionButton = self.subviews[i] as! XZEmotionButton;
            btn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
            btn.imageEdgeInsets = UIEdgeInsetsMake(6, 6, 6, 6)
            let rect : CGRect = CGRect(x: inset + CGFloat(i % ICEmotionMaxCols) * btnW, y: inset + CGFloat(i / ICEmotionMaxCols)*btnH, width: btnW, height: btnH)
            btn.frame = rect
            
            i += 1
        }
    }
    
    
    func setEmotions ( _ emotions : Array<XZEmotion>) {
        self.emotions = emotions
        for item in emotions {
            let button = XZEmotionButton()
            self.addSubview(button)
            button.setEmotion(item) 
            button.addTarget(self, action: #selector(emotionBtnClicked), for: .touchUpOutside)
        }
    }
      
}
