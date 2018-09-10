//
//  XZChatBoxMoreView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatBoxMoreView: UIView {

    lazy var picBtn : UIButton = {
        let pBtn = UIButton()
        pBtn.setImage(UIImage(named: "icon_zhaopian"), for: .normal)
        return pBtn
    }()
    
    lazy var zhuanBtn : UIButton = {
        let zhuanBtn = UIButton()
        zhuanBtn.setImage(UIImage(named: "iconchat_zhuanzhang"), for: .normal)
        return zhuanBtn
    }()
    
    lazy var voiceBtn : UIButton = {
        let voiceBtn = UIButton()
        voiceBtn.setImage(UIImage(named: "icon_yuying"), for: .normal)
        return voiceBtn
    }()

    lazy var timeBtn : UIButton = {
        let timeBtn = UIButton()
        timeBtn.setImage(UIImage(named: "icon_shijian"), for: .normal)
        return timeBtn
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
        
        self.addSubview(self.picBtn)
        self.addSubview(self.zhuanBtn)
        self.addSubview(self.voiceBtn)
        self.addSubview(self.timeBtn)
        
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
    }
}
