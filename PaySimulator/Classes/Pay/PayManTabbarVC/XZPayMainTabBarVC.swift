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
        addChileVc(storyName: "PayHome", "主页", "shouye", "shouyea")
        addChileVc(storyName: "PayMoney","财富", "pinwei", "pinweia")
        addChileVc(storyName: "PayPraise","口碑", "gouwuche", "gouwuchea")
        addChileVc(storyName: "PayFriend","朋友", "geren", "gerena")
        addChileVc(storyName: "PayMe", "我的", "fenlei", "fenleia")
        //默认点击我的控制器
        selectedIndex = 4;
    }

    
    //私有方法
    private func addChileVc(storyName : String,_ title  : String, _ imgName:String,_ selectImgName:String){
        //1.通过storyboard获取控制器
        let childVC = UIStoryboard(name:storyName, bundle: nil).instantiateInitialViewController()!
//        let nav = XZBaseNavigationVC(rootViewController: childVC)
        childVC.tabBarItem.title = storyName
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
