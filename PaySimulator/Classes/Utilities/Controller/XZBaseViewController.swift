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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 下面两种方法其实有点区别的，有空可以琢磨一下
        if animated {
            // 隐藏导航栏有动画
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            // 隐藏导航栏没有动画
            self.navigationController?.isNavigationBarHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if animated {
            // 隐藏导航栏有动画
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        } else {
            // 隐藏导航栏没有动画
            self.navigationController?.isNavigationBarHidden = false
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        setupNavBar()
        
    }
    
    fileprivate func setupNavBar()
    {
//        navBar.dd_y = -DDSafeAreaTopHeight
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
            navBar.wr_setLeftButton(normalImage: UIImage(named: "icon_fanhuiblue")!, highlightedImage: UIImage(named: "icon_fanhuiblue")!, title:"返回" , titleColor: ddBlueColor())
        }
        
        navBar.onClickRightButton = {() in
            self.rightBtnOnClick()
        }
    }
    
    @objc fileprivate func back()
    {
        self.leftBtnOnClick()
        _ = navigationController?.popViewController(animated: true)
    }
}

extension XZBaseViewController {
    @objc func rightBtnOnClick() {
        
    }
    
    @objc func leftBtnOnClick() {
        
    }
}
