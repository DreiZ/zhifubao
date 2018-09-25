//
//  XZChatMessageVoiceCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageVoiceCell: XZBaseMessageCell {
    
    var voiceRead : (()->())?

    lazy var voiceImage : UIImageView = {
        let vImage = UIImageView()
        vImage.contentMode = UIViewContentMode.scaleAspectFit
        return vImage
    }()
    
    lazy var durationLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.init(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1)
        tempLabel.font = MessageVoiceFont
        tempLabel.textAlignment = .right
        return tempLabel
    }()
    
    lazy var redView : UIView = {
        let redView = UIView()
        redView.backgroundColor = UIColor.init(red: 244.0/255.0, green: 51.0/255.0, blue: 60.0/255.0, alpha: 1)
        redView.layer.masksToBounds = true
        redView.layer.cornerRadius = MessageRedViewWidth/2.0
        
        return redView
    }()

    lazy var voiceBtn : UIButton = {
        let voiceBtn = UIButton()
        voiceBtn.addTarget(self, action: #selector(voiceBtnOnClick), for: .touchUpInside)
        return voiceBtn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageVoiceCell {
        let identifier = TypeVoice
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageVoiceCell
        if cell == nil {
            cell = XZChatMessageVoiceCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
    override class func cellWithTableView(_ tableView : UITableView, identifier : String) -> XZChatMessageVoiceCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageVoiceCell
        if cell == nil {
            cell = XZChatMessageVoiceCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
}


extension XZChatMessageVoiceCell {
    
    func setupMyUI() {
        self.addSubview(self.voiceImage)
        self.addSubview(self.durationLabel)
        self.addSubview(self.redView)
        self.addSubview(self.voiceBtn)
        
        self.voiceBtn.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self.bubbleView)
            make.right.equalTo(self.bubbleView.snp.right).offset(-MessageSystemArrowWidth)
        }
    }
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        self.durationLabel.text = String((modelFrame.model?.message?.voiceTime) ?? 1) + "''"
        
        if modelFrame.model?.isSender ?? true {
            self.voiceImage.image = UIImage(named: "spk_i")?.withRenderingMode(.alwaysTemplate)
            self.voiceImage.tintColor = UIColor.white
            let transform : CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/1));
            self.voiceImage.transform = transform
            
            self.durationLabel.textAlignment = .right
        }else {
            self.voiceImage.image = UIImage(named: "spk_i")?.withRenderingMode(.alwaysTemplate)
            self.voiceImage.tintColor = UIColor.init(red: 133.0/255.0, green: 133.0/255.0, blue: 133.0/255.0, alpha: 1)
            self.voiceImage.transform = CGAffineTransform.identity
            
            if modelFrame.model?.message?.status == XZMessageStatus.read {
                self.redView.isHidden = true
            }else {
                self.redView.isHidden = false
            }
            
            self.durationLabel.textAlignment = .left
        }
        
        self.voiceImage.frame = modelFrame.voiceIconF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.durationLabel.frame = modelFrame.durationLabelF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.bubbleView.frame = modelFrame.bubbleViewF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.redView.frame = modelFrame.redViewF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
    }
    
    
    @objc func voiceBtnOnClick() {
        if self.longPressDelegate != nil {
            self.redView.isHidden = true
            self.longPressDelegate?.contentPress(self.modelFrame)
        }
    }
}
