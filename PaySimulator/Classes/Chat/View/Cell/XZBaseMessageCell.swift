//
//  XZBaseMessageCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

protocol BaseCellDelegate {
    func longPress(longRecognizer : UILongPressGestureRecognizer)
    func headImageClick(eId : String)
}

class XZBaseMessageCell: UITableViewCell {
    
    var longPressDelegate : BaseCellDelegate?
    var modelFrame : XZMessageFrame?
    
    lazy var headImageView : UIImageView = {
        let imageView = UIImageView()
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(XZBaseMessageCell.headClicked))
        
        imageView.addGestureRecognizer(tapGes)
        return imageView
    }()
    
    lazy var bubbleView : UIImageView = {
        let imageView = UIImageView()
        
        
        return imageView
    }()

    lazy var activityView : UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView()
        
        return activityView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func cellWithTableView(_ tableView : UITableView) -> XZBaseMessageCell {
        let identifier = "XZBaseMessageCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? XZBaseMessageCell
        if cell == nil {
            cell = XZBaseMessageCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
}

extension XZBaseMessageCell {
    
    func setupUI () {
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none

        let longPressGes = UILongPressGestureRecognizer(target: self, action: #selector(XZBaseMessageCell.longPressRecognizer(_ :)))
        // 长按手势最小触发时间
        longPressGes.minimumPressDuration = 0.5
        self.addGestureRecognizer(longPressGes)
        
        self.contentView.addSubview(self.bubbleView)
        self.contentView.addSubview(self.headImageView)
        self.contentView.addSubview(self.activityView)
    }

    @objc func longPressRecognizer(_ recognizer : UILongPressGestureRecognizer) {
        if longPressDelegate != nil {
            longPressDelegate?.longPress(longRecognizer: recognizer)
        }
    }
    
    @objc func headClicked()  {
        if longPressDelegate != nil {
            longPressDelegate?.headImageClick(eId: self.modelFrame?.model?.message?.from ?? "")
        }
    }
}

extension XZBaseMessageCell {
    @objc func setModelFrame(modelFrame : XZMessageFrame) {
        self.modelFrame = modelFrame
        let messageModel = modelFrame.model
        
        self.headImageView.frame = modelFrame.headImageViewF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.bubbleView.frame = modelFrame.bubbleViewF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        
        if messageModel?.isSender == true {
            self.activityView.frame = modelFrame.activityF ?? CGRect(x: 0, y: 0, width: 0, height: 0)
            
            switch modelFrame.model?.message?.deliveryState {
                case .pending? :
                        print("")
                
                case .delivering? :
                        self.activityView.isHidden = false
                        self.activityView.startAnimating()
                case .delivered? :
                        self.activityView.stopAnimating()
                        self.activityView.isHidden = true
                case .failure? :
                    self.activityView.stopAnimating()
                    self.activityView.isHidden = true
                
                case .serviceFaid? :
                    self.activityView.stopAnimating()
                    self.activityView.isHidden = true
                
                
                case .none:
                    self.activityView.stopAnimating()
                    self.activityView.isHidden = true
            }
            
            if modelFrame.model?.message?.type == TypeFile || modelFrame.model?.message?.type == TypePicText {
                self.bubbleView.image = UIImage(named: "Dialog_pt.right")
            }
            else if modelFrame.model?.message?.type == TypeText {
                self.bubbleView.image = UIImage(named: "Dialog_green.right")
            }
            else if modelFrame.model?.message?.type == TypeRedPacket {
                self.bubbleView.image = UIImage(named: "Dialog_orange.right")
            }
            else if modelFrame.model?.message?.type == TypeRedPacketOpen {
                self.bubbleView.image = UIImage(named: "Dialog_orange.right")
            }
            else if modelFrame.model?.message?.type == TypeTransfer {
                self.bubbleView.image = UIImage(named: "Dialog_blue.right")
            }
        }else {
            if modelFrame.model?.message?.type == TypeFile || modelFrame.model?.message?.type == TypePicText {
                self.bubbleView.image = UIImage(named: "Dialog_pt.left")
            }
            else if modelFrame.model?.message?.type == TypeText {
                self.bubbleView.image = UIImage(named: "Dialog_pt.left")
            }
            else if modelFrame.model?.message?.type == TypeRedPacket {
                self.bubbleView.image = UIImage(named: "Dialog_orange.left")
            }
            else if modelFrame.model?.message?.type == TypeRedPacketOpen {
                self.bubbleView.image = UIImage(named: "Dialog_orange.left")
            }
            else if modelFrame.model?.message?.type == TypeTransfer {
                self.bubbleView.image = UIImage(named: "Dialog_blue.left")
            }
        }
    }
}
