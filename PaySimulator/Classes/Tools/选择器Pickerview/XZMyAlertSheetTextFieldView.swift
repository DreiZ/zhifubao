//
//  XZMyAlertSheetTextFieldView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/26.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMyAlertSheetTextFieldView: UIView{
    
    var title : String = "标题" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    var doneBlock : ((_ text : String) -> ())?
    
    
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "账单分类"
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textAlignment = NSTextAlignment.center
        
        return titleLabel
    }()
    
    lazy var contView : UIView = {
        let contView = UIView()
        contView.backgroundColor = UIColor.white
        contView.layer.masksToBounds = true
        contView.layer.cornerRadius = 4
        return contView
    }()
    
    lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.white
        
//        let backBtn = UIButton()
//        backBtn.setImage(UIImage(named: "icon-fanhui"), for: .normal)
//        backBtn.addTarget(self, action: #selector(dissmissBack), for: .touchUpInside)
//        topView.addSubview(backBtn)
//        backBtn.snp.makeConstraints({ (make) in
//            make.left.top.bottom.equalTo(topView)
//            make.width.equalTo(50)
//        })
//
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = ddColorFromHex("e8e8e8")
        topView.addSubview(bottomLineView)
        bottomLineView.snp.makeConstraints({ (make) in
            make.left.bottom.right.equalTo(topView)
            make.height.equalTo(1)
        })
        
        topView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints({ (make) in
            make.center.equalTo(topView)
        })
        return topView
    }()
    
    lazy var textField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 245.0/250.0, green: 245.0/250.0, blue: 245.0/250.0, alpha: 1)
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 3
        textField.layer.borderColor = kChatMainColor.cgColor
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .whileEditing
        textField.leftViewMode = .always
        return textField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// ui 初始化
extension XZMyAlertSheetTextFieldView {
    func setupUI() {
        self.backgroundColor = UIColor.init(white: 0.01, alpha: 0.5)
        
        let backBtn = UIButton()
        backBtn.addTarget(self, action: #selector(dissmiss), for: .touchUpInside)
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        self.addSubview(self.contView)
        self.contView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-110)
            make.height.equalTo(200)
            make.width.equalTo(280)
        }
        
        self.contView.addSubview(self.topView)
        self.topView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self.contView)
            make.height.equalTo(46)
        }
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.white
        self.contView.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contView)
            make.height.equalTo(54)
        }
//
        
        self.contView.addSubview(self.textField)
        self.textField.snp.makeConstraints { (make) in
            make.top.equalTo(self.topView.snp.bottom).offset(25)
            make.centerX.equalTo(self.contView.snp.centerX)
            make.width.equalTo(240)
            make.height.equalTo(40)
        }
        
       
        
        
        let sureBtn = UIButton()
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.setTitleColor(UIColor.white, for: .normal)
        sureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        sureBtn.backgroundColor = kChatMainColor
        sureBtn.addTarget(self, action: #selector(sureBtnOnClick), for: .touchUpInside)
        sureBtn.layer.masksToBounds = true
        sureBtn.layer.cornerRadius = 3
        contView.addSubview(sureBtn)
        sureBtn.snp.makeConstraints({ (make) in
            make.bottom.equalTo(contView.snp.bottom).offset(-20)
            make.left.equalTo(contView.snp.left).offset(30)
            make.right.equalTo(contView.snp.right).offset(-30)
            make.height.equalTo(40)
        })
    }
}


//相关方法
extension XZMyAlertSheetTextFieldView  {
    
    @objc private func dissmiss() {
        self.removeFromSuperview()
    }
    
    @objc private func dissmissBack() {
        self.removeFromSuperview()
    }
    
    @objc private func sureBtnOnClick() {
        if doneBlock != nil {
            doneBlock!(textField.text ?? "")
        }
        self.removeFromSuperview()
    }
    
    
    func showInView (showView : UIView) {
        self.frame = CGRect(x: 0, y: 0, width: kWindowW, height: kWindowH)
        UIApplication.shared.keyWindow?.addSubview(self)
        self.textField.becomeFirstResponder()
    }
}
