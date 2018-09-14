//
//  XZChatMessageSystemCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageSystemCell: XZBaseMessageCell {
    
    lazy var contentLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.textColor = UIColor.white
        tempLabel.font = MessageSystemFont
        tempLabel.textAlignment = .center
        return tempLabel
    }()
   
    
    lazy var backView : UIView = {
        let tempView = UIView()
        tempView.backgroundColor = UIColor.init(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1)
        tempView.layer.masksToBounds = true
        tempView.layer.cornerRadius = 2.0
        
        return tempView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageSystemCell {
        let identifier = TypeSystem
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageSystemCell
        if cell == nil {
            cell = XZChatMessageSystemCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
}

extension XZChatMessageSystemCell {
    
    func setupMyUI () {
        self.addSubview(self.backView)
        self.addSubview(self.contentLabel)

//        self.backView.snp.makeConstraints { (make) in
//            make.left.equalTo(self.contentLabel.snp.left).offset(-9)
//            make.right.equalTo(self.contentLabel.snp.left).offset(11)
//            make.top.equalTo(self.contentLabel.snp.left).offset(-6)
//            make.bottom.equalTo(self.contentLabel.snp.left).offset(6)
//        }
    }
    
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        self.contentLabel.attributedText = XZFaceManager.transferSystemMessageString(image: modelFrame.model?.message?.systemImage, leftMessage: (modelFrame.model?.message?.systemLeft)!, rightMessage: (modelFrame.model?.message?.systemRight)!)
        self.contentLabel.frame = modelFrame.systemViewF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
    }
}
