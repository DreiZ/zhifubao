//
//  XZChatBoxFaceView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatBoxFaceView: UIView {

//    kChatBackColor
    let listView : XZEmotionListView = XZEmotionListView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension XZChatBoxFaceView {
    func setupUI () {
        self.backgroundColor = kChatBackColor
        
        XZFaceManager.sgetEmojiEmotion()
        
        self.addSubview(self.listView)
        self.listView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.listView.setEmotions( XZFaceManager.emojiMEmotions)
    }
}
