//
//  XZBaseNavigationVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBaseNavigationVC: UINavigationController , UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        interactivePopGestureRecognizer?.delegate = self;
 
//        navigationBar.setBackgroundImage(UIImage(named: "navBlue.jpg"), for: .top, barMetrics: .default);
        navigationBar.setBackgroundImage(UIImage(named: "navBlue.jpg"), for: .default)
//        navigationBar.barTintColor = ddBlueColor()
        
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,NSAttributedStringKey.font:UIFont.systemFont(ofSize:18)];
        navigationBar.isTranslucent = false;//不透明
         
    }
 
    //重写push方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count>0 {//不是第一层控制器，有父级控制器
          
            viewController.hidesBottomBarWhenPushed = true
            
        }else{
            
            
        }
        
        super.pushViewController(viewController, animated: true)
        
    }
//返回手势
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return childViewControllers.count>1
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController?{
        return topViewController;
    }
    
}
