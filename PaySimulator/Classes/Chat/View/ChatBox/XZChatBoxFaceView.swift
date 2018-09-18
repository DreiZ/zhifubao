//
//  XZChatBoxFaceView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatBoxFaceView: UIView {

    let listView : XZEmotionListView = XZEmotionListView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func sendEmotion(sender : UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: GXEmotionDidSendNotification), object: nil, userInfo: nil)
    }
}

extension XZChatBoxFaceView {
    func setupUI () {
        self.backgroundColor = kChatBackColor
        
        _ = XZFaceManager.sgetEmojiEmotion()
        
        self.addSubview(self.listView)
        self.listView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
        
        self.listView.setEmotions(XZFaceManager.emojiMEmotions)
        
        let bottomView = UIView()
        
        let topLineView : UIView = UIView()
        topLineView.backgroundColor = UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 0.3)
        bottomView.addSubview(topLineView)
        topLineView.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(bottomView)
            make.height.equalTo(0.5)
        })
        
        let sendBtn = UIButton()
        sendBtn.setTitle("发送", for: .normal)
        sendBtn.setTitleColor(UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1), for: .normal)
        sendBtn.addTarget(self, action: #selector(sendEmotion(sender:)), for: .touchUpInside)
        sendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sendBtn.layer.masksToBounds = true
        sendBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        sendBtn.layer.shadowRadius = 3
        sendBtn.layer.shadowColor = UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1).cgColor
        bottomView.addSubview(sendBtn)
        sendBtn.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(bottomView)
            make.width.equalTo(50)
        }
        
        self.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(40)
        }
    }
}
