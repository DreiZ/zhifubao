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
        
        
        let label = self.getLabel(title: "图片")
        let label1 = self.getLabel(title: "转账")
        let label2 = self.getLabel(title: "语音")
        let label3 = self.getLabel(title: "时间")
        let label4 = self.getLabel(title: "红包")
        
        self.addSubview(label)
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(label3)
        self.addSubview(label4)
        
        self.picBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(12)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.snp.left).offset(ddSpacing(66))
        }
        
        label.snp.makeConstraints { (make ) in
            make.top.equalTo(self.picBtn.snp.bottom)
            make.centerX.equalTo(self.picBtn.snp.centerX)
        }
        
        self.zhuanBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.picBtn.snp.top)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.picBtn.snp.right).offset(ddSpacing(66))
        }
        
        label1.snp.makeConstraints { (make ) in
            make.top.equalTo(self.zhuanBtn.snp.bottom)
            make.centerX.equalTo(self.zhuanBtn.snp.centerX)
        }
        
        self.voiceBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.picBtn.snp.top)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.zhuanBtn.snp.right).offset(ddSpacing(66))
        }
        
        label2.snp.makeConstraints { (make ) in
            make.top.equalTo(self.voiceBtn.snp.bottom)
            make.centerX.equalTo(self.voiceBtn.snp.centerX)
        }
        
        self.timeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.picBtn.snp.top)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.voiceBtn.snp.right).offset(ddSpacing(66))
        }
        
        label3.snp.makeConstraints { (make ) in
            make.top.equalTo(self.timeBtn.snp.bottom)
            make.centerX.equalTo(self.timeBtn.snp.centerX)
        }
        
        self.redPacketBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.picBtn.snp.bottom).offset(22)
            make.width.height.equalTo(ddSpacing(104))
            make.left.equalTo(self.picBtn.snp.left)
        }
        
        label4.snp.makeConstraints { (make ) in
            make.top.equalTo(self.redPacketBtn.snp.bottom)
            make.centerX.equalTo(self.redPacketBtn.snp.centerX)
        }
    }
    
    func getLabel (title : String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = UIColor(red: 133.0/255.0, green: 133.0/255.0, blue: 133.0/255.0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        
        
        return label
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

