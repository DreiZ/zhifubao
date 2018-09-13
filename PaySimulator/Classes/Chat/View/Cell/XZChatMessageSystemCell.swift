//
//  XZChatMessageSystemCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageSystemCell: XZBaseMessageCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageSystemCell {
        let identifier = "XZChatMessageSystemCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageSystemCell
        if cell == nil {
            cell = XZChatMessageSystemCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
}

extension XZChatMessageSystemCell {
    func setupMyUI () {
        
    }
}
