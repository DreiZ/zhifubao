//
//  XZChatMessageImageCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageImageCell: XZBaseMessageCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageImageCell {
        let identifier = "XZChatMessageImageCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageImageCell
        if cell == nil {
            cell = XZChatMessageImageCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }

}

extension XZChatMessageImageCell {
    func setupMyUI () {
        
    }
}
