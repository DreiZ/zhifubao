//
//  XZChatBoxMoreView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

protocol XZChatBoxMoreViewDelegate {
    func didSelectItem(moreView : XZChatBoxMoreView, selectType : XZChatBoxMoreType)
}

class XZChatBoxMoreView: UIView {
    
    var deletgate : XZChatBoxMoreViewDelegate?

    lazy var picBtn : UIButton = {
        let pBtn = UIButton()
        pBtn.tag = 0
        pBtn.setImage(UIImage(named: "icon_zhaopian"), for: .normal)
        pBtn.addTarget(self, action: #selector(btnOnClick(sender :)), for: .touchUpInside)
        return pBtn
    }()
    
    lazy var zhuanBtn : UIButton = {
        let zhuanBtn = UIButton()
        zhuanBtn.tag = 1
        zhuanBtn.setImage(UIImage(named: "iconchat_zhuanzhang"), for: .normal)
        zhuanBtn.addTarget(self, action: #selector(btnOnClick(sender :)), for: .touchUpInside)
        return zhuanBtn
    }()
    
    lazy var voiceBtn : UIButton = {
        let voiceBtn = UIButton()
        voiceBtn.tag = 2
        voiceBtn.setImage(UIImage(named: "icon_yuying"), for: .normal)
        voiceBtn.addTarget(self, action: #selector(btnOnClick(sender :)), for: .touchUpInside)
        return voiceBtn
    }()

    lazy var timeBtn : UIButton = {
        let timeBtn = UIButton()
        timeBtn.tag = 3
        timeBtn.setImage(UIImage(named: "icon_shijian"), for: .normal)
        timeBtn.addTarget(self, action: #selector(btnOnClick(sender :)), for: .touchUpInside)
        return timeBtn
    }()
    
    lazy var redPacketBtn : UIButton = {
        let redPacketBtn = UIButton()
        redPacketBtn.tag = 4
        redPacketBtn.setImage(UIImage(named: "moreRedPacket"), for: .normal)
        redPacketBtn.addTarget(self, action: #selector(btnOnClick(sender :)), for: .touchUpInside)
        return redPacketBtn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension XZChatBoxMoreView {
    func setupUI () {
        self.backgroundColor = kChatBackColor
        
        self.addSubview(self.picBtn)
        self.addSubview(self.zhuanBtn)
        self.addSubview(self.voiceBtn)
        self.addSubview(self.timeBtn)
        self.addSubview(self.redPacketBtn)
        
        self.picBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(12)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.snp.left).offset(ddSpacing(66))
        }
        
        self.zhuanBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.picBtn.snp.top)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.picBtn.snp.right).offset(ddSpacing(66))
        }
        
        self.voiceBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.picBtn.snp.top)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.zhuanBtn.snp.right).offset(ddSpacing(66))
        }
        
        self.timeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.picBtn.snp.top)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.voiceBtn.snp.right).offset(ddSpacing(66))
        }
        
        self.redPacketBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.picBtn.snp.bottom).offset(12)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.picBtn.snp.left)
        }
    }
}

extension XZChatBoxMoreView {
    
    @objc func btnOnClick(sender : UIButton) {
        if deletgate != nil {
            if sender.tag == 0 {
                deletgate?.didSelectItem(moreView: self, selectType: XZChatBoxMoreType.album)
            }else if sender.tag == 1 {
                deletgate?.didSelectItem(moreView: self, selectType: XZChatBoxMoreType.transfer)
            }else if sender.tag == 2 {
                deletgate?.didSelectItem(moreView: self, selectType: XZChatBoxMoreType.voice)
            }else if sender.tag == 3 {
                deletgate?.didSelectItem(moreView: self, selectType: XZChatBoxMoreType.time)
            }else if sender.tag == 4 {
                deletgate?.didSelectItem(moreView: self, selectType: XZChatBoxMoreType.redPacket)
            }
        }
    }
}

