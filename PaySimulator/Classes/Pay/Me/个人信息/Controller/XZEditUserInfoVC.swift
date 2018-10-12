//
//  XZEditUserInfoVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/4.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
//定义确定block闭包传值
typealias backBlock = ((_ value : String) ->())

class XZEditUserInfoVC: XZBaseViewController {

 
    var textField = UITextField()
    var textStr = ""
    var rightBtn : UIButton?
    //传值的 闭包属性
    var postValueBlock : backBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = ddTableColor
        setupUI()
        setupNav()
    }

   
    //创建textField
    private func setupUI(){
        
        let backView = UIView()
        self.view.addSubview(backView)
        backView.backgroundColor = UIColor.white
        backView.snp.makeConstraints { (make ) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(DDSafeAreaTopHeight)
            make.height.equalTo(40)
        }
        
        textField.textColor = UIColor.darkGray
        textField.backgroundColor = UIColor.white
        textField.font = UIFont.systemFont(ofSize:kLabelFont)
        textField.clearButtonMode = .always
        textField.borderStyle = .none
        view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(DDSafeAreaTopHeight)
            make.height.equalTo(40)
        }
        
        textField.addTarget(self, action: #selector(textEditChange(textField:)), for: .editingChanged)
        
        textStr = textField.text ?? ""
    }
    
    //创建导航栏右侧按钮
    func setupNav(){
        
        
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize:18)];
//
//
//
//        let leftBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 40, height: 40), titleName: "取消")
//        leftBtn.setTitleColor(ddBlueColor(), for: .normal)
//        leftBtn.addTarget(self, action: #selector(clickLeftItem), for: .touchUpInside)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
//
////        self.navBar
//
//        //右侧按钮
//        let rightBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 40, height: 40), titleName: "确定")
//        rightBtn.setTitleColor(ddBlueColor(), for: .normal)
//        rightBtn.setTitleColor(ddColorFromHex("#FFFFF"), for: .disabled)
//        rightBtn.addTarget(self, action: #selector(clickRightItem), for: .touchUpInside)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
//        self.rightBtn = rightBtn
//        rightBtn.isEnabled = true
        self.navBar.wr_setRightButton(title: "确定", titleColor: UIColor.white)
        self.navBar.wr_setLeftButton(title: "取消", titleColor: UIColor.white)
        self.navBar.barBackgroundColor = ddBlueColor()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func rightBtnOnClick() {
        self.clickRightItem()
    }
    
    override func leftBtnOnClick() {
        self.clickLeftItem()
    }
}

//MARK:--事件监听
extension XZEditUserInfoVC{
    
    //导航栏点击事件
    @objc  func clickLeftItem(){
        
        print("取消 ")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc  func clickRightItem(){
        print("确定 ")
        guard let postValueBlock = postValueBlock else {
            return
        }
        
        postValueBlock(textField.text ?? "")
       
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //textField监听
    @objc private func textEditChange(textField:UITextField){
        
        print(textField.text ?? "")
        
        if textStr ==  textField.text {
            rightBtn?.isEnabled = false
        }else{
            rightBtn?.isEnabled = true
        }
    }
}
