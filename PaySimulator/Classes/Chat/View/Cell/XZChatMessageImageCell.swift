//
//  XZChatMessageImageCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/11.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatMessageImageCell: XZBaseMessageCell {

    lazy var messageImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupMyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func cellWithTableView(_ tableView : UITableView) -> XZChatMessageImageCell {
        let identifier = TypePic
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZChatMessageImageCell
        if cell == nil {
            cell = XZChatMessageImageCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }

}

extension XZChatMessageImageCell {
    func setupMyUI () {
        self.bubbleView.addSubview(messageImageView)
        self.messageImageView.snp.makeConstraints { (make ) in
            make.edges.equalToSuperview()
        }
    }
    
    override func setModelFrame(modelFrame: XZMessageFrame) {
        super.setModelFrame(modelFrame: modelFrame)
        
        self.messageImageView.image = modelFrame.model?.message?.image
        self.messageImageView.image = self.getArrowImage(imageSize: (modelFrame.bubbleViewF?.size)!, image: (modelFrame.model?.message?.image)!, isSender: (modelFrame.model?.isSender)!)
//        self.messageImageView.frame = modelFrame.imageViewF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
    }
    
    func getArrowImage(imageSize : CGSize, image : UIImage, isSender : Bool) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
        let contextRef = UIGraphicsGetCurrentContext()
        let path = self.getBezierPath(isSender: isSender, imageSize: imageSize)
        contextRef!.addPath(path.cgPath)
        contextRef?.clip(using: CGPathFillRule.evenOdd)
        image.draw(in: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        
        let arrowImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return arrowImage!
    }
    
    func getBezierPath(isSender : Bool, imageSize : CGSize) -> UIBezierPath {
        let arrowWidth : CGFloat = MessageSystemArrowWidth;
        let arrowHeight : CGFloat = MessageSystemArrowHeight;
        let marginTop : CGFloat = 15;
        let imageW : CGFloat = imageSize.width;
        
        var path : UIBezierPath
        if isSender {
            path = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: imageSize.width - arrowWidth, height: imageSize.height), cornerRadius: 3)
            path.move(to: CGPoint(x: imageW - MessageSystemArrowWidth, y: 0))
            path.addLine(to: CGPoint(x: imageW - arrowWidth, y: marginTop))
            path.addLine(to: CGPoint(x: imageW, y: marginTop + 0.5 * arrowHeight))
            path.addLine(to: CGPoint(x: imageW - MessageSystemArrowWidth, y: marginTop + arrowHeight))
            path.close()
        }else {
            path = UIBezierPath.init(roundedRect: CGRect(x: arrowWidth, y: 0, width: imageSize.width - arrowWidth, height: imageSize.height), cornerRadius: 3)
            path.move(to: CGPoint(x: arrowWidth, y: 0))
            path.addLine(to: CGPoint(x: arrowWidth, y: marginTop))
            path.addLine(to: CGPoint(x: 0, y: marginTop + 0.5 * arrowHeight))
            path.addLine(to: CGPoint(x: arrowWidth, y: marginTop + arrowHeight))
            path.close()
        }
        
        return path
    }
}


























