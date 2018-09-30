//
//  XZChatEditMessageCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit


class XZChatEditMessageCell: UITableViewCell {
    
    lazy var headImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        return imageView
    }()
    
    lazy var nameLabel : KILabel = {
        let chatLabel : KILabel = KILabel()
        chatLabel.numberOfLines = 0
        chatLabel.font = UIFont.systemFont(ofSize: 14)
        chatLabel.textColor = UIColor.init(red: 12.0/255.0, green: 12.0/255.0, blue: 12.0/255.0, alpha: 1)
        
        return chatLabel
    }()
    
    lazy var rightLabel : KILabel = {
        let chatLabel : KILabel = KILabel()
        chatLabel.numberOfLines = 0
        chatLabel.font = UIFont.systemFont(ofSize: 12.5)
        chatLabel.textColor = UIColor.init(red: 117.0/255.0, green: 117.0/255.0, blue: 117.0/255.0, alpha: 1)
        
        return chatLabel
    }()
    
    class func cellWithTableView(_ tableView : UITableView) -> XZChatEditMessageCell {
        let identifier = "XZChatEditMessageCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatEditMessageCell
        if cell == nil {
            cell = XZChatEditMessageCell(style: .default, reuseIdentifier: "XZChatEditMessageCell")
        }
        
        return cell!
    }
    
    class func cellWithTableView(_ tableView : UITableView, identifier : String) -> XZChatEditMessageCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatEditMessageCell
        if cell == nil {
            cell = XZChatEditMessageCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension XZChatEditMessageCell {
    func setupUI() {
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
        
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(self.contentView.snp.left).offset(15)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        self.contentView.addSubview(self.headImageView)
        self.headImageView.snp.makeConstraints { (make ) in
            make.right.equalTo(self.snp.right).offset(-35)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(32)
        }
        
        self.contentView.addSubview(self.rightLabel)
        self.rightLabel.snp.makeConstraints { (make ) in
            make.right.equalTo(self.headImageView.snp.left)
            make.centerY.equalTo(self.contentView.snp.centerY)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = kChatBackColor
        self.contentView.addSubview(lineView)
        lineView.snp.makeConstraints { (make ) in
            make.left.bottom.right.equalTo(self.contentView)
            make.height.equalTo(0.5)
        }
    }
    
    func setData (headImage : UIImage?, nickName : String?, title : String?) {
        self.nameLabel.text = title
        self.rightLabel.text = nickName
        self.headImageView.image = headImage
        
        if headImage == nil {
            self.headImageView.snp.remakeConstraints { (make ) in
                make.right.equalTo(self.snp.right).offset(-35)
                make.centerY.equalTo(self.snp.centerY)
                make.width.height.equalTo(0)
            }
        }else {
            self.headImageView.snp.remakeConstraints { (make ) in
                make.right.equalTo(self.snp.right).offset(-35)
                make.centerY.equalTo(self.snp.centerY)
                make.width.height.equalTo(32)
            }
        }
    }
}
