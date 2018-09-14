//
//  XZChatMessageTimeCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/14.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageTimeCell: XZBaseMessageCell {

    lazy var timeLabel : KILabel = {
        let timeLabel : KILabel = KILabel()
        timeLabel.numberOfLines = 1
        timeLabel.font = MessageTimeFont
        timeLabel.textColor = UIColor(red: 130.0/255.0, green: 131.0/255.0, blue: 132.0/255.0, alpha: 1)
        
        return timeLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageTimeCell {
        let identifier = TypeTime
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageTimeCell
        if cell == nil {
            cell = XZChatMessageTimeCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
    override class func cellWithTableView(_ tableView : UITableView, identifier : String) -> XZChatMessageTimeCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageTimeCell
        if cell == nil {
            cell = XZChatMessageTimeCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }

}

extension XZChatMessageTimeCell {
    func setupMyUI() {
        self.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.contentView.snp.centerX)
            make.top.equalTo(self.contentView.snp.top).offset(MessageSystemTimeTopSpace)
        }
    }
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        self.timeLabel.text = XZMessageHelper.timeFormatWithDate(time: (modelFrame.model?.message?.voiceTime) ?? 1530000000)
        
    }
}

