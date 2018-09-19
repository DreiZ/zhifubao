//
//  XZPayMainTabBarVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayMainTabBarVC: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self;
        // Do any additional setup after loading the view.
        addChileVc(storyName: "PayHome", "主页", "icon_shouye", "icon_shouye1")
        addChileVc(storyName: "PayMoney","财富", "icon_caifu", "icon_caifu1")
        addChileVc(storyName: "PayPraise","口碑", "icon_koubei", "icon_koubei1")
        addChileVc(storyName: "PayFriend","朋友", "icon_pengyou", "icon_pengyou1")
        addChileVc(storyName: "PayMe", "我的", "pay_icon_wode", "pay_icon_wode1")
        //默认点击我的控制器
        selectedIndex = 4;
    }

    
    //私有方法
    private func addChileVc(storyName : String,_ title  : String, _ imgName:String,_ selectImgName:String){
        //1.通过storyboard获取控制器
        let childVC = UIStoryboard(name:storyName, bundle: nil).instantiateInitialViewController()!
//        let nav = XZBaseNavigationVC(rootViewController: childVC)
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: imgName)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImgName)
        //将VC添加进来
        addChildViewController(childVC);
        
    }
    
    //tabbar点击事件 代理方法，仅仅朋友和我的 控制器可以点击显示，不是就直接反会false
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
        if viewController .isEqual (viewControllers?[1]) || viewController .isEqual (viewControllers?[2]){
            return false
        }

        return true
    }

    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if viewController .isEqual (viewControllers?[0])  {
            let  keyWindow = UIApplication.shared.keyWindow;
            let tabBarVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            
            keyWindow?.rootViewController = tabBarVC;
        }
    }
}
