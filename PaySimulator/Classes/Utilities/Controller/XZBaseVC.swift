//
//  XZBaseVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle{
        if (self.navigationController?.childViewControllers.count)!>1 {
            return .default
        }
        return .lightContent
    }
    

}

/*
 
 // 一行代码搞定导航栏颜色
 navBarBarTintColor = .white
 // 一行代码搞定导航栏透明度
 navBarBackgroundAlpha = alpha
 // 一行代码搞定导航栏两边按钮颜色
 navBarTintColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1.0)
 // 一行代码搞定导航栏上标题颜色
 navBarTitleColor = .black
 // 一行代码搞定状态栏是 default 还是 lightContent
 statusBarStyle = .default
 // 一行代码搞定导航栏底部分割线是否隐藏
 navBarShadowImageHidden = true;
 
 //////////8888888//////
 
 
 
 // 设置导航栏默认的背景颜色
 UIColor.defaultNavBarBarTintColor = UIColor.init(red: 0/255.0, green: 175/255.0, blue: 240/255.0, alpha: 1)
 // 设置导航栏所有按钮的默认颜色
 UIColor.defaultNavBarTintColor = .white
 // 设置导航栏标题默认颜色
 UIColor.defaultNavBarTitleColor = .white
 // 统一设置状态栏样式
 UIColor.defaultStatusBarStyle = .lightContent
 // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
 UIColor.defaultShadowImageHidden = true
 */
