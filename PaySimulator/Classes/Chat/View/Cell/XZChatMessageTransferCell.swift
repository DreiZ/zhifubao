//
//  XZChatMessageTransferCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/12.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageTransferCell: XZBaseMessageCell {
    
    lazy var transImage : UIImageView = {
        let transImage = UIImageView()
        transImage.image = UIImage(named: "TRANSFER")
        return transImage
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
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageTransferCell {
        let identifier = TypeTransfer
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageTransferCell
        if cell == nil {
            cell = XZChatMessageTransferCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
}


extension XZChatMessageTransferCell {
    func setupMyUI() {
        self.addSubview(self.transImage)
        self.addSubview(self.moneyLabel)
        self.addSubview(self.desLabel)
        self.addSubview(self.typeLabel)
        self.addSubview(self.iconImageView)
    }
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        
        
    }
}
