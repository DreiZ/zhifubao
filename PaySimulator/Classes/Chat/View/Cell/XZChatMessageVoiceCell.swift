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
}
