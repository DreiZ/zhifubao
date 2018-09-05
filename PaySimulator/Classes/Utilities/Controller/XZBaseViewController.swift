//
//  XZBaseViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/5.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBaseViewController: UIViewController {

    lazy var navBar = WRCustomNavigationBar.CustomNavigationBar()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        setupNavBar()
        
    }
    
    fileprivate func setupNavBar()
    {
        
        view.addSubview(navBar)
        
        // 设置自定义导航栏背景图片
//        navBar.barBackgroundImage = UIImage(named: "millcolorGrad")
        
        // 设置自定义导航栏背景颜色
         navBar.backgroundColor = ddBlueColor()
        
        // 设置自定义导航栏标题颜色
        navBar.titleLabelColor = UIColor.black
        
        // 设置自定义导航栏左右按钮字体颜色
//        navBar.wr_setTintColor(color: .white)
        
        if self.navigationController?.childViewControllers.count != 1 {
            navBar.wr_setLeftButton(image: UIImage(named: "icon_fanhui")!, title: "返回", titleColor: ddBlueColor())
        }
    }
    
    @objc fileprivate func back()
    {
        _ = navigationController?.popViewController(animated: true)
    }
}
