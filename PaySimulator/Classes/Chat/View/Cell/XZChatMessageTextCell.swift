//
//  XZChatMessageTextCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageTextCell: XZBaseMessageCell {

    lazy var chatLabel : KILabel = {
        let chatLabel : KILabel = KILabel()
        chatLabel.numberOfLines = 0
        chatLabel.font = MessageFont
        chatLabel.textColor = UIColor.white
        
        return chatLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageTextCell {
        let identifier = TypeText
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageTextCell
        if cell == nil {
            cell = XZChatMessageTextCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
    override class func cellWithTableView(_ tableView : UITableView, identifier : String) -> XZChatMessageTextCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageTextCell
        if cell == nil {
            cell = XZChatMessageTextCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }

}

extension XZChatMessageTextCell {
    func setupMyUI() {
        self.addSubview(self.chatLabel)
    }
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        self.chatLabel.frame = modelFrame.chatLabelF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.chatLabel.attributedText = XZFaceManager.transferMessageString(message: (modelFrame.model?.message?.content) ?? "", font: self.chatLabel.font, lineHeight: self.chatLabel.font.lineHeight, isSender: (modelFrame.model?.isSender)!)
        
    }
}
