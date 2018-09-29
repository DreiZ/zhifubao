//
//  XZUserTableViewCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/29.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZUserTableViewCell: UITableViewCell {
    
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
    
    lazy var trueNameLabel : KILabel = {
        let chatLabel : KILabel = KILabel()
        chatLabel.numberOfLines = 0
        chatLabel.font = UIFont.systemFont(ofSize: 12.5)
        chatLabel.textColor = UIColor.init(red: 117.0/255.0, green: 117.0/255.0, blue: 117.0/255.0, alpha: 1)
        
        return chatLabel
    }()

    class func cellWithTableView(_ tableView : UITableView) -> XZUserTableViewCell {
        let identifier = "XZUserTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZUserTableViewCell
        if cell == nil {
            cell = XZUserTableViewCell(style: .default, reuseIdentifier: "XZUserTableViewCell")
        }

        return cell!
    }
    
    class func cellWithTableView(_ tableView : UITableView, identifier : String) -> XZUserTableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZUserTableViewCell
        if cell == nil {
            cell = XZUserTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
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


extension XZUserTableViewCell {
    func setupUI() {
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.headImageView)
        self.headImageView.snp.makeConstraints { (make ) in
            make.left.equalTo(self.snp.left).offset(10)
            make.top.equalTo(self.snp.top).offset(6)
            make.width.height.equalTo(32)
        }
        
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(self.headImageView.snp.right).offset(10)
            make.top.equalTo(self.snp.top).offset(6)
        }
        
        self.contentView.addSubview(self.trueNameLabel)
        self.trueNameLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(self.headImageView.snp.right).offset(10)
            make.bottom.equalTo(self.headImageView.snp.bottom)
        }
        
        let lineView = UIView()
        lineView.backgroundColor = kChatBackColor
        self.contentView.addSubview(lineView)
        lineView.snp.makeConstraints { (make ) in
            make.left.bottom.right.equalTo(self.contentView)
            make.height.equalTo(0.5)
        }
    }
    
    func setData (headImage : UIImage?, nickName : String?, trueName : String?) {
        self.nameLabel.text = nickName
        self.trueNameLabel.text = trueName
        self.headImageView.image = headImage
        
        if trueName == nil {
            self.nameLabel.snp.remakeConstraints { (make ) in
                make.left.equalTo(self.headImageView.snp.right).offset(10)
                make.centerY.equalTo(self.snp.centerY)
            }
        }else {
            self.nameLabel.snp.remakeConstraints { (make ) in
                make.left.equalTo(self.headImageView.snp.right).offset(10)
                make.top.equalTo(self.snp.top).offset(6)
            }
            self.trueNameLabel.snp.remakeConstraints { (make ) in
                make.left.equalTo(self.headImageView.snp.right).offset(10)
                make.bottom.equalTo(self.headImageView.snp.bottom)
            }
        }
    }
}
