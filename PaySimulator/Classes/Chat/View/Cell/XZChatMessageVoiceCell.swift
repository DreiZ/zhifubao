//
//  XZChatMessageVoiceCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageVoiceCell: XZBaseMessageCell {

    lazy var voiceImage : UIImageView = {
        let vImage = UIImageView()
        
        return vImage
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageVoiceCell {
        let identifier = "XZChatMessageVoiceCell"
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
    }
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        if modelFrame.model?.isSender ?? true {
            self.voiceImage.image = UIImage(named: "spk_i")?.withRenderingMode(.alwaysTemplate)
            self.voiceImage.tintColor = UIColor.white
            let transform : CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/180.0));
            self.voiceImage.transform = transform
        }else {
            self.voiceImage.image = UIImage(named: "spk_i")?.withRenderingMode(.alwaysOriginal)
            self.voiceImage.transform = CGAffineTransform.identity
        }
    }
}
