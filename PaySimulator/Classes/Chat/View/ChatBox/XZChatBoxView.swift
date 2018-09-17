//
//  XZChatBoxView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

protocol XZChatBoxDelegate {
    /**
     *  输入框状态(位置)改变
     *
     *  @param chatBox    chatBox
     *  @param fromStatus 起始状态
     *  @param toStatus   目的状态
     */
    func chatBoxChangeStatus(chatBox : XZChatBoxView, fromStatus : XZChatBoxStatus, toStatus : XZChatBoxStatus )
    
    /**
     *  发送消息
     *
     *  @param chatBox     chatBox
     *  @param textMessage 消息
     */
    func sendTextMessage(chatBox : XZChatBoxView, textMessage : String)
    
    /**
     *  输入框高度改变
     *
     *  @param chatBox chatBox
     *  @param height  height
     */
    func changeChatBoxHeight(chaBox : XZChatBoxView, boxHeight : CGFloat)
    
    
    /**
     *  开始录音
     *
     *  @param chatBox chatBox
     */
    func chatBoxDidStartRecordingVoice(chaBox : XZChatBoxView)
    func chatBoxDidStopRecordingVoice(chaBox : XZChatBoxView)
    func chatBoxDidCancelRecordingVoice(chaBox : XZChatBoxView)
    func chatBoxDidDrag(inside : Bool)
    
}

class XZChatBoxView: UIView {
    
    
    var delegate : XZChatBoxDelegate?
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
        voiceBtn.addTarget(self, action: #selector(voiceBtnDown(sender:)), for: .touchUpInside)
        
        return voiceBtn
    }()
    
    lazy var faceBtn : UIButton = {
        let faceBtn = UIButton()
        faceBtn.setImage(UIImage(named: "icon_biaoqing"), for: .normal)
        faceBtn.addTarget(self, action: #selector(faceBtnDown(sender:)), for: .touchUpInside)
        return faceBtn
    }()
    
    lazy var moreBtn : UIButton = {
        let moreBtn = UIButton()
        moreBtn.setImage(UIImage(named: "icon_tianjia"), for: .normal)
        moreBtn.addTarget(self, action: #selector(moreBtnDown(sender:)), for: .touchUpInside)
        return moreBtn
    }()
    
    var talkBtn : UIButton = {
        let talkBtn : UIButton = UIButton()
        talkBtn.setTitle("按住 说话", for: .normal)
        talkBtn.setTitle("松开 结束", for: .highlighted)
        talkBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        talkBtn.setTitleColor(UIColor.init(red: 100.0/255.0, green: 101.0/255.0, blue: 101.0/255.0, alpha: 1), for: .normal)
        talkBtn.setBackgroundImage(UIImage.imageWithColor(UIColor.init(red: 247.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1)), for: .normal)
        talkBtn.setBackgroundImage(UIImage.imageWithColor(UIColor.init(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)), for: .normal)
        
        talkBtn.layer.masksToBounds = true
        talkBtn.layer.cornerRadius = 4
        talkBtn.layer.borderWidth = 0.5
        talkBtn.layer.borderColor = UIColor.init(red: 179.0/255.0, green: 180.0/255.0, blue: 183.0/255.0, alpha: 1).cgColor
        
        talkBtn.addTarget(self , action: #selector(talkButtonDown(sender:)), for: .touchDown)
        talkBtn.addTarget(self , action: #selector(talkButtonUpInside(sender:)), for: .touchUpInside)
        talkBtn.addTarget(self , action: #selector(talkButtonUpOutside(sender:)), for: .touchUpOutside)
        talkBtn.addTarget(self , action: #selector(talkButtonTouchCancel(sender:)), for: .touchCancel)
        talkBtn.addTarget(self , action: #selector(talkButtonDragOutside(sender:)), for: .touchDragOutside)
        talkBtn.addTarget(self , action: #selector(talkButtonDragInside(sender:)), for: .touchDragInside)
        
        return talkBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        
        self.addNotification()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension XZChatBoxView {
    
    func setupUI ()  {
        self.backgroundColor = kChatBoxBackColor
        
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

//MARK: textView Delegate
extension XZChatBoxView : UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.status = XZChatBoxStatus.showKeyboard
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 5000 {
            let text = textView.text!
            textView.text = String(text.prefix(5000))
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            if self.iTextView.text.count > 0 {
                if delegate != nil {
                    delegate?.sendTextMessage(chatBox: self, textMessage: self.iTextView.text)
                }
            }
        }
        self.iTextView.text = ""
        
        return true
    }
}

extension XZChatBoxView {
    //通知监听
    func addNotification() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(emotionDidSelected (notifi:)), name: NSNotification.Name(rawValue: GXEmotionDidSelectNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(deleteBtnClicked), name: NSNotification.Name(rawValue: GXEmotionDidSelectNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(sendMessage), name: NSNotification.Name(rawValue: GXEmotionDidSelectNotification), object: nil)
    }
    
    @objc func emotionDidSelected(notifi : NSNotification) {
        
    }
    
    @objc func deleteBtnClicked() {
        
    }
    
    @objc func sendMessage() {
        
    }
    
    //去除第一响应者
    
    override func resignFirstResponder() -> Bool {
    
        self.iTextView.resignFirstResponder()
        faceBtn.setImage(UIImage(named: "icon_biaoqing"), for: .normal)
        return super.resignFirstResponder()
    }
    
    
    //语音button
    @objc func talkButtonDown(sender : UIButton) {
        if delegate != nil {
            delegate?.chatBoxDidStartRecordingVoice(chaBox: self)
        }
    }
    
    @objc func talkButtonUpInside(sender : UIButton) {
        if delegate != nil {
            delegate?.chatBoxDidStopRecordingVoice(chaBox: self)
        }
    }
    
    @objc func talkButtonUpOutside(sender : UIButton) {
        if delegate != nil {
            delegate?.chatBoxDidStartRecordingVoice(chaBox: self)
        }
    }
    
    @objc func talkButtonTouchCancel(sender : UIButton) {
        
    }
    
    @objc func talkButtonDragOutside(sender : UIButton) {
        if delegate != nil {
            delegate?.chatBoxDidDrag(inside: false)
        }
    }
    
    @objc func talkButtonDragInside(sender : UIButton) {
        if delegate != nil {
            delegate?.chatBoxDidDrag(inside: true)
        }
    }
    
    //语音操作
    @objc func voiceBtnDown(sender : UIButton)  {
        let lastStatus = self.status
        
        if lastStatus == XZChatBoxStatus.showVideo {
            self.status = XZChatBoxStatus.showKeyboard
            self.talkBtn.isHidden = true
            self.iTextView.isHidden = false
            self.iTextView.becomeFirstResponder()
            voiceBtn.setImage(UIImage(named: "icon_yuyingshuru"), for: .normal)
        }else {
            self.status = XZChatBoxStatus.showVideo
            self.iTextView.resignFirstResponder()
            self.iTextView.isHidden = true
            self.talkBtn.isHidden = false
            voiceBtn.setImage(UIImage(named: "icon_yuyingshuru"), for: .normal)//图没找到
        }
        
        if delegate != nil {
            delegate?.chatBoxChangeStatus(chatBox: self, fromStatus: lastStatus, toStatus: self.status)
        }
    }
    
    //语音操作
    @objc func faceBtnDown(sender : UIButton)  {
        let lastStatus = self.status
        
        if  lastStatus == XZChatBoxStatus.showFace {
            self.status = XZChatBoxStatus.showKeyboard
            faceBtn.setImage(UIImage(named: "icon_biaoqing"), for: .normal)
            iTextView.becomeFirstResponder()
        }else {
            talkBtn.isHidden = true
            iTextView.isHidden = false
            voiceBtn.setImage(UIImage(named: "icon_yuyingshuru"), for: .normal)
            status = XZChatBoxStatus.showFace
            faceBtn.setImage(UIImage(named: "icon_jianpan"), for: .normal)
            
            if lastStatus == XZChatBoxStatus.showVideo {
                
            }else if lastStatus == XZChatBoxStatus.showVideo {
                talkBtn.isHidden = true
                iTextView.isHidden = false
                voiceBtn.setImage(UIImage(named: "icon_yuyingshuru"), for: .normal)
            }else if lastStatus == XZChatBoxStatus.showKeyboard {
                iTextView.resignFirstResponder()
                self.status = XZChatBoxStatus.showFace
            }else if lastStatus == XZChatBoxStatus.showVideo {
                self.talkBtn.isHidden = true
                self.iTextView.isHidden = false
                voiceBtn.setImage(UIImage(named: "icon_yuyingshuru"), for: .normal)
                self.status = XZChatBoxStatus.showFace
            }
        }
        
        if delegate != nil {
            delegate?.chatBoxChangeStatus(chatBox: self, fromStatus: lastStatus, toStatus: self.status)
        }
    }
    
    //语音操作
    @objc func moreBtnDown(sender : UIButton)  {
        let lastStatus = self.status
        
        if lastStatus == XZChatBoxStatus.showMore {
            self.status = XZChatBoxStatus.showKeyboard
            self.iTextView.becomeFirstResponder()
        }else {
            self.talkBtn.isHidden = true
            self.iTextView.isHidden = false
            voiceBtn.setImage(UIImage(named: "icon_yuyingshuru"), for: .normal)
            
            self.status = XZChatBoxStatus.showMore
            
            if lastStatus == XZChatBoxStatus.showFace {
                faceBtn.setImage(UIImage(named: "icon_biaoqing"), for: .normal)
            }else if lastStatus == XZChatBoxStatus.showVideo {
                talkBtn.isHidden = true
                iTextView.isHidden = false
                voiceBtn.setImage(UIImage(named: "icon_yuyingshuru"), for: .normal)
            }else if lastStatus == XZChatBoxStatus.showKeyboard {
                self.iTextView.resignFirstResponder()
                self.status = XZChatBoxStatus.showMore
            }
        }
        
        if delegate != nil {
            delegate?.chatBoxChangeStatus(chatBox: self, fromStatus: lastStatus, toStatus: self.status)
        }
    }
    
}





























