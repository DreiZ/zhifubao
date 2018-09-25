//
//  XZSendRoleView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/25.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZSendRoleView: UIView {

    var selectBlock : ((_ : Bool)->())?
    var isSelf : Bool = true
    var toUser : XZUserModel?
    var selfUser : XZUserModel?
    
    var selfUserImage : UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var toUserImage : UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    var selfUserLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    var toUserLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()

    
    var selfUserBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "gouwu-weixuan"), for: .normal)
        btn.setImage(UIImage(named: "gouxuan"), for: .selected)
        btn.tag = 0
        btn.addTarget(self, action: #selector(selectRole(sender:)), for: .touchUpInside)
        return btn
    }()
    
    var toUserBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "gouwu-weixuan"), for: .normal)
        btn.setImage(UIImage(named: "gouxuan"), for: .selected)
        btn.tag = 1
        btn.addTarget(self, action: #selector(selectRole(sender:)), for: .touchUpInside)
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension XZSendRoleView {
    func setupUI() {
        
        self.backgroundColor = UIColor.init(white: 0.01, alpha: 0.5)
        
        let backBtn = UIButton()
        self.addSubview(backBtn)
        backBtn.addTarget(self, action: #selector(dissmissBack), for: .touchUpInside)
        backBtn.snp.makeConstraints { (make ) in
            make.edges.equalTo(self)
        }
        
        let cancleView = UIButton()
        cancleView.layer.cornerRadius = 5
        cancleView.backgroundColor = kChatMainColor
        cancleView.addTarget(self, action: #selector(sure), for: .touchUpInside)
        cancleView.setTitle("确定", for: .normal)
        self.addSubview(cancleView)
        cancleView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(50)
        }
        
        let contView = UIView()
        contView.backgroundColor = UIColor.white
        self.addSubview(contView)
        contView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
            make.bottom.equalTo(cancleView.snp.top).offset(-10)
            make.height.equalTo(200)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "切换发对话的角色"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.backgroundColor = kChatMainColor
        titleLabel.textAlignment = NSTextAlignment.center
        contView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(contView)
            make.height.equalTo(50)
        }
        
        let stitleLabel = UILabel()
        stitleLabel.text = "请选择发对的角色"
        stitleLabel.textColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
        stitleLabel.font = UIFont.systemFont(ofSize: 13)
        stitleLabel.textAlignment = NSTextAlignment.center
        contView.addSubview(stitleLabel)
        stitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.equalTo(contView)
            make.height.equalTo(40)
        }
        
        contView.addSubview(self.selfUserBtn)
        selfUserBtn.snp.makeConstraints { (make ) in
            make.left.equalTo(contView.snp.left).offset(15)
            make.top.equalTo(stitleLabel.snp.bottom).offset(0)
            make.width.height.equalTo(44)
        }
        selfUserBtn.isSelected = true

        contView.addSubview(self.toUserBtn)
        toUserBtn.snp.makeConstraints { (make ) in
            make.left.equalTo(contView.snp.left).offset(15)
            make.top.equalTo(selfUserBtn.snp.bottom).offset(0)
            make.width.height.equalTo(44)
        }

        //---------image------
        contView.addSubview(self.selfUserImage)
        selfUserImage.snp.makeConstraints { (make ) in
            make.left.equalTo(selfUserBtn.snp.right).offset(26)
            make.centerY.equalTo(selfUserBtn.snp.centerY)
            make.width.height.equalTo(30)
        }

        contView.addSubview(self.toUserImage)
        toUserImage.snp.makeConstraints { (make ) in
            make.left.equalTo(toUserBtn.snp.right).offset(26)
            make.centerY.equalTo(toUserBtn.snp.centerY)
            make.width.height.equalTo(30)
        }
        
        
        //----------label-----
        contView.addSubview(self.selfUserLabel)
        selfUserLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(selfUserImage.snp.right).offset(26)
            make.centerY.equalTo(selfUserBtn.snp.centerY)
            make.right.equalTo(contView.snp.right).offset(-10)
        }
        
        contView.addSubview(self.toUserLabel)
        toUserLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(toUserImage.snp.right).offset(26)
            make.centerY.equalTo(toUserBtn.snp.centerY)
            make.right.equalTo(contView.snp.right).offset(-10)
        }
        
    }
    
    func setData(selfUser : XZUserModel, toUser : XZUserModel, isSelectSelf : Bool) {
        selfUserImage.image = selfUser.headImage
        toUserImage.image = toUser.headImage
        
        selfUserLabel.text = selfUser.trueName
        toUserLabel.text = toUser.trueName
        
        selfUserBtn.isSelected = isSelectSelf
        toUserBtn.isSelected = !isSelectSelf
    }
    
    @objc func selectRole(sender : UIButton) {
        self.isSelf = sender.tag == 0 ? true:false
        
        self.selfUserBtn.isSelected = self.isSelf
        self.toUserBtn.isSelected = !self.isSelf
    }
    
    @objc private func sure() {
        if self.selectBlock != nil {
            selectBlock!(self.isSelf)
        }
        
        self.removeFromSuperview()
    }
    
    @objc private func dissmissBack() {
        self.removeFromSuperview()
    }
}
