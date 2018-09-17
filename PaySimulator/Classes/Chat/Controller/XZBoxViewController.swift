//
//  XZBoxViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

protocol XZChatBoxViewControllerDelegate {
    func changeBoxHeight(chatBoxViewController : XZBoxViewController, chatBoxHeight : CGFloat)
    
    func sendTextMessage(chatBoxViewController : XZBoxViewController, message : String)
    
    func senderImageMessage(chatBoxViewController : XZBoxViewController, image : UIImage, imagePath : String)
    
    func sendVoiceMessage(chatBoxViewController : XZBoxViewController, voicePath : String)
    
    func voiceDidStartRecording()
    
    func voiceRecordSoShort()
    
    func voiceWillDragout(inside : Bool)
    
    func voiceDidCancleRecording()
    
    func videoDidAppeared(chatBoxViewController : XZBoxViewController, videoView : XZChatBoxMoreView )
    
    func sendVideoMessage(chatBoxViewController : XZBoxViewController, videoPath : String)
    
    func sendFileMessage(chatBoxViewController : XZBoxViewController, fileName : String)
}

class XZBoxViewController: UIViewController {
    
    var delegate : XZChatBoxViewControllerDelegate?
    
    var keyboardFrame : CGRect?

    lazy var chatBox : XZChatBoxView = {
        let chatBox = XZChatBoxView()
        chatBox.delegate = self
        return chatBox
    }()
    
    lazy var moreView : XZChatBoxMoreView = {
       let moreView = XZChatBoxMoreView()
        
        return moreView
    }()
    
    lazy var faceView : XZChatBoxFaceView = {
        let faceView = XZChatBoxFaceView()
        
        return faceView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide (notifi:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardFrameWillChange (notifi:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

extension XZBoxViewController {
    private func setupUI () {
        self.view.backgroundColor = kChatBackColor
        
        self.view.addSubview(self.chatBox)
        self.chatBox.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(kTabBarHeight)
        }
        
        self.view.addSubview(self.moreView)
        self.moreView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(kChatMoreViewHeight)
            make.top.equalTo(self.view.snp.top).offset(50)
        }
        
        self.view.addSubview(self.faceView)
        self.faceView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(kChatMoreViewHeight)
            make.top.equalTo(self.view.snp.top).offset(50)
        }
    }
}


//private
extension XZBoxViewController {
    @objc func keyboardWillHide(notifi : NSNotification) {
        self.keyboardFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        if delegate != nil {
            delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: kTabBarHeight)
//            chatBox.status = XZChatBoxStatus.nothing
        }
    }
    
    @objc func keyboardFrameWillChange(notifi : NSNotification) {
        self.keyboardFrame = notifi.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect
        
        if chatBox.status == XZChatBoxStatus.showKeyboard && (self.keyboardFrame?.size.height)! <= HEIGHT_CHATBOXVIEW {
            return
        } else if (chatBox.status == XZChatBoxStatus.showFace || chatBox.status == XZChatBoxStatus.showMore) && (self.keyboardFrame?.size.height)! <= HEIGHT_CHATBOXVIEW {
            return
        }
        
        if delegate != nil {
            delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: (self.keyboardFrame?.size.height)! + kTabBarHeight)
            chatBox.status = XZChatBoxStatus.showKeyboard
        }
    }
}

extension XZBoxViewController :  XZChatBoxDelegate {
    func chatBoxChangeStatus(chatBox: XZChatBoxView, fromStatus: XZChatBoxStatus, toStatus: XZChatBoxStatus) {
        if toStatus == XZChatBoxStatus.showKeyboard {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute:
                {
                    //code
                    self.faceView.removeFromSuperview()
                    self.moreView.removeFromSuperview()
            })
        }else if toStatus == XZChatBoxStatus.showVoice {
            UIView.animate(withDuration: 0.3, animations: {
                if self.delegate != nil {
                    self.delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: kTabBarHeight)
                }
            }) { (finished : Bool) in
                self.faceView.removeFromSuperview()
                self.moreView.removeFromSuperview()
            }
        }else if toStatus == XZChatBoxStatus.showFace {
            
            if fromStatus == XZChatBoxStatus.showVoice {
                
                self.view.addSubview(self.faceView)

                self.faceView.snp.makeConstraints { (make) in
                    make.left.right.equalToSuperview()
                    make.height.equalTo(kChatMoreViewHeight)
                    make.top.equalTo(self.view.snp.top).offset(50)
                }
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                    if self.delegate != nil {
                        self.delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: kTabBarHeight + HEIGHT_CHATBOXVIEW)
                    }
                })
            }else {
                self.view.addSubview(self.faceView)

                self.view.addSubview(self.faceView)
                self.faceView.snp.makeConstraints { (make) in
                    make.left.right.equalToSuperview()
                    make.height.equalTo(kChatMoreViewHeight)
                    make.top.equalTo(self.view.snp.top).offset(50)
                }
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                    self.faceView.frame = CGRect(x: 0, y: kTabBarHeight, width: kWindowW, height: kTabBarHeight + HEIGHT_CHATBOXVIEW)
                }) { (finished : Bool) in
                    self.moreView.removeFromSuperview()
                }
                
                if fromStatus != XZChatBoxStatus.showMore {
                    UIView.animate(withDuration: 0.2) {
                        if self.delegate != nil {
                            self.delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: HEIGHT_CHATBOXVIEW + kTabBarHeight)
                        }
                    }
                }
            }
        }else if toStatus == XZChatBoxStatus.showMore {
            if fromStatus == XZChatBoxStatus.showVoice {
                self.view.addSubview(self.moreView)
                
                self.view.addSubview(self.moreView)
                self.moreView.snp.makeConstraints { (make) in
                    make.left.right.equalToSuperview()
                    make.height.equalTo(kChatMoreViewHeight)
                    make.top.equalTo(self.view.snp.top).offset(50)
                }
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                    if self.delegate != nil {
                        self.delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: HEIGHT_CHATBOXVIEW + kTabBarHeight)
                    }
                }
            }else {
                self.view.addSubview(self.moreView)
                
                self.view.addSubview(self.moreView)
                self.moreView.snp.makeConstraints { (make) in
                    make.left.right.equalToSuperview()
                    make.height.equalTo(kChatMoreViewHeight)
                    make.top.equalTo(self.view.snp.top).offset(50)
                }
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.layoutIfNeeded()
                }) { (finish : Bool) in
                    self.faceView.removeFromSuperview()
                }
                
                UIView.animate(withDuration: 0.2) {
                    if self.delegate != nil {
                        self.delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: HEIGHT_CHATBOXVIEW + kTabBarHeight)
                    }
                }
            }
        }
    }
    
    func sendTextMessage(chatBox: XZChatBoxView, textMessage: String) {
        if delegate != nil {
            delegate?.sendTextMessage(chatBoxViewController: self, message: textMessage)
        }
    }
    
    func changeChatBoxHeight(chaBox: XZChatBoxView, boxHeight: CGFloat) {
        self.faceView.frame = CGRect(x: 0, y: boxHeight, width: kWindowW, height: self.faceView.frame.size.height)
        self.moreView.frame = CGRect(x: 0, y: boxHeight, width: kWindowW, height: self.moreView.frame.size.height)
        
        if delegate != nil {
            let h : CGFloat = (self.chatBox.status == XZChatBoxStatus.showFace ? HEIGHT_CHATBOXVIEW : (self.keyboardFrame?.size.height)!) + boxHeight
            self.delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: h)
        }
    }
    
    func chatBoxDidStartRecordingVoice(chaBox: XZChatBoxView) {
        if delegate != nil {
            delegate?.voiceDidStartRecording()
        }
    }
    
    func chatBoxDidStopRecordingVoice(chaBox: XZChatBoxView) {
        if delegate != nil {
            self.delegate?.sendVoiceMessage(chatBoxViewController: self, voicePath: "")
        }
    }
    
    func chatBoxDidCancelRecordingVoice(chaBox: XZChatBoxView) {
        if delegate != nil {
            delegate?.voiceDidCancleRecording()
        }
    }
    
    func chatBoxDidDrag(inside: Bool) {
        if delegate != nil {
            delegate?.voiceWillDragout(inside: inside)
        }
    }
}


extension XZBoxViewController {
    override func resignFirstResponder() -> Bool {
        if self.chatBox.status == XZChatBoxStatus.showVoice {
            if delegate != nil {
                UIView.animate(withDuration: 0.3, animations: {
                    self.delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: kTabBarHeight)
                }) { (finished : Bool) in
                    self.chatBox.status = XZChatBoxStatus.showKeyboard
                }
            }
            return super.resignFirstResponder()
        }
        
        if self.chatBox.status != XZChatBoxStatus.nothing && self.chatBox.status != XZChatBoxStatus.showVoice {
            let _ = self.chatBox.resignFirstResponder()
            if delegate != nil {
                UIView.animate(withDuration: 0.3, animations: {
                    self.delegate?.changeBoxHeight(chatBoxViewController: self, chatBoxHeight: kTabBarHeight)
                }) { (finished : Bool) in
                    self.faceView.removeFromSuperview()
                    self.moreView.removeFromSuperview()
                    self.chatBox.status = XZChatBoxStatus.nothing
                }
            }
        }
        
        return super.resignFirstResponder()
    }
}




















