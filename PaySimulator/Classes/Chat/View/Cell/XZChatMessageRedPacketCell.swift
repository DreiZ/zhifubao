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
        redPacketImage.image = UIImage(named: "GIFTSHARE_close")
        return redPacketImage
    }()
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.white
        titleLabel.font = MessageFont
        titleLabel.textAlignment = .left
        return titleLabel
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
        typeLabel.textColor = UIColor.init(red: 165.0/255.0, green: 165.0/255.0, blue: 165.0/255.0, alpha: 1)
        typeLabel.font = MessageSubFont
        typeLabel.textAlignment = .left
        typeLabel.text = "红包"
        return typeLabel
    }()
    
    lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "zhi_icon")
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
        self.addSubview(self.titleLabel)
        self.addSubview(self.desLabel)
        self.addSubview(self.typeLabel)
        self.addSubview(self.iconImageView)
    }
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        redPacketImage.image = UIImage(named: "GIFTSHARE_close")
        
        self.redPacketImage.frame = modelFrame.transImageF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.titleLabel.frame = modelFrame.titleLabelF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.desLabel.frame = modelFrame.desLabelF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.typeLabel.frame = modelFrame.typeLabelF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.iconImageView.frame = modelFrame.iconImageViewF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        
        
        self.titleLabel.text = (modelFrame.model?.message?.content) ?? ""
        
        self.desLabel.text = "查看红包"
    }
}

