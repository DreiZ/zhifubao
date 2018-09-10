//
//  XZChatBoxView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatBoxView: UIView {
    
    var status : XZChatBoxStatus = .nothing 
    
    
    lazy var topLineView : UIView = {
        let LineView = UIView()
        LineView.backgroundColor = kLineColor
        
        return LineView
    }()
    
    lazy var bottomLineView : UIView = {
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = kLineColor
        
        return bottomLineView
    }()
    
    lazy var iTextView : UITextView = {
        let iTextView = UITextView()
        iTextView.font = UIFont.systemFont(ofSize: 16)
        iTextView.layer.masksToBounds = true
        iTextView.layer.cornerRadius = 3
        iTextView.layer.borderColor = kLineColor.cgColor
        iTextView.layer.borderWidth = 0.5
        iTextView.scrollsToTop = false
        iTextView.returnKeyType = UIReturnKeyType.send
        iTextView.backgroundColor = UIColor.white
        
        return iTextView
    }()
   
    
    lazy var voiceBtn : UIButton = {
        let voiceBtn = UIButton()
        voiceBtn.setImage(UIImage(named: "icon_yuyingshuru"), for: .normal)
        
        return voiceBtn
    }()
    
    lazy var faceBtn : UIButton = {
        let faceBtn = UIButton()
        faceBtn.setImage(UIImage(named: "icon_biaoqing"), for: .normal)
        
        return faceBtn
    }()
    
    lazy var moreBtn : UIButton = {
        let moreBtn = UIButton()
        moreBtn.setImage(UIImage(named: "icon_tianjia"), for: .normal)
        
        return moreBtn
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension XZChatBoxView {
    func setupUI ()  {
        self.backgroundColor = UIColor.white
        
        let contView = UIView()
        self.addSubview(contView)
        contView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        contView.addSubview(self.topLineView)
        self.topLineView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        contView.addSubview(self.bottomLineView)
        self.bottomLineView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        contView.addSubview(self.voiceBtn)
        self.voiceBtn.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(34)
        }
        
        
        contView.addSubview(self.moreBtn)
        self.moreBtn.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(34)
        }
        
        contView.addSubview(self.faceBtn)
        self.faceBtn.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.right.equalTo(self.moreBtn.snp.left)
            make.width.equalTo(32)
        }
        
        contView.addSubview(self.iTextView)
        self.iTextView.snp.makeConstraints { (make) in
            make.left.equalTo(self.voiceBtn.snp.right).offset(9)
            make.right.equalTo(self.faceBtn.snp.left).offset(-7)
            make.centerY.equalToSuperview()
            make.height.equalTo(32)
        }
    }
}


extension XZChatBoxView : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        
        return true
    }
}
