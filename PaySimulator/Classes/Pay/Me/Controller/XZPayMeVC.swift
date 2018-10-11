//
//  XZPayMeVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayMeVC: XZBaseViewController {
//MARK:--Storyboard属性
    
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //导航栏
        setupNavigationUI()
//        setStatusBarBackgroundColor(color: ddBlueColor())
//        let navView = XZPayMeNavView.loadNavView()
//        navView.frame = CGRect(x: 0, y: 0, width: kWindowW, height: DDSafeAreaTopHeight)
//        self.view.addSubview(navView)
      
    }
    
  
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 下面两种方法其实有点区别的，有空可以琢磨一下
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
       
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
//        if animated {
//            // 隐藏导航栏有动画
//            self.navigationController?.setNavigationBarHidden(false, animated: false)
//        } else {
//            // 隐藏导航栏没有动画
//            self.navigationController?.isNavigationBarHidden = false
//        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
}

//MARK:--UI相关方法
extension XZPayMeVC{
    //设置 导航栏
    private func setupNavigationUI(){
        topConstraint.constant = DDSafeAreaTopHeight - (DDSafeAreaTopHeight-44)
//        navigationItem.title = "我的"
//        navBarTintColor = UIColor.white
//        navBarBarTintColor = ddBlueColor()
//        navBarTitleColor = UIColor.white
//        let addBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 20, height: 20), imgName: "", titleName: "设置")
//        let firstBar = UIBarButtonItem(customView: addBtn)
//        navigationItem.rightBarButtonItems = [firstBar]
        self.navBar.title = "我的"
        self.navBar.wr_setRightButton(title: "设置", titleColor: .white)
        self.navBar.titleLabelColor = UIColor.white
        self.navBar.barBackgroundColor = ddBlueColor()
    }
}

