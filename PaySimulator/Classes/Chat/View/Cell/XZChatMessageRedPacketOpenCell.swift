//
//  XZChatMessageRedPacketOpenCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/15.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageRedPacketOpenCell: XZChatMessageRedPacketCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageRedPacketOpenCell {
        let identifier = TypeRedPacketOpen
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageRedPacketOpenCell
        if cell == nil {
            cell = XZChatMessageRedPacketOpenCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
}

extension XZChatMessageRedPacketOpenCell {
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        redPacketImage.image = UIImage(named: "GIFTSHARE_open")
        
        self.redPacketImage.frame = modelFrame.transImageF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.titleLabel.frame = modelFrame.titleLabelF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.desLabel.frame = modelFrame.desLabelF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.typeLabel.frame = modelFrame.typeLabelF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.iconImageView.frame = modelFrame.iconImageViewF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        
        
        self.titleLabel.text = (modelFrame.model?.message?.content) ?? ""
        
        if modelFrame.model?.isSender == true {
            self.desLabel.text = "红包已被领完"
        }else {
            self.desLabel.text = "红包已领取"
        }
    }
}
