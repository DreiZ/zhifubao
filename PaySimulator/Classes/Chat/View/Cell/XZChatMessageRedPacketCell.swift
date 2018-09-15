//
//  XZChatMessageRedPacketCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageRedPacketCell: XZBaseMessageCell {
    
    lazy var redPacketImage : UIImageView = {
        let redPacketImage = UIImageView()
        redPacketImage.image = UIImage(named: "GIFTSHARE")
        return redPacketImage
    }()
    
    lazy var moneyLabel : UILabel = {
        let moneyLabel = UILabel()
        moneyLabel.textColor = UIColor.white
        moneyLabel.font = MessageFont
        moneyLabel.textAlignment = .left
        return moneyLabel
    }()
    
    lazy var desLabel : UILabel = {
        let desLabel = UILabel()
        desLabel.textColor = UIColor.white
        desLabel.font = MessageSubFont
        desLabel.textAlignment = .left
        return desLabel
    }()
    
    lazy var typeLabel : UILabel = {
        let typeLabel = UILabel()
        typeLabel.textColor = UIColor.white
        typeLabel.font = MessageSubFont
        typeLabel.textAlignment = .left
        return typeLabel
    }()
    
    lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "zhi_yuebao")
        return iconImageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageRedPacketCell {
        let identifier = TypeRedPacket
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageRedPacketCell
        if cell == nil {
            cell = XZChatMessageRedPacketCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
}


extension XZChatMessageRedPacketCell {
    
    func setupMyUI() {
        self.addSubview(self.redPacketImage)
        self.addSubview(self.moneyLabel)
        self.addSubview(self.desLabel)
        self.addSubview(self.typeLabel)
        self.addSubview(self.iconImageView)
    }
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        
        
    }
}

