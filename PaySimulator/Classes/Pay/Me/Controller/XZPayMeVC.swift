//
//  XZPayMeVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/8/30.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayMeVC: XZBaseVC {
//MARK:--Storyboard属性
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //导航栏
        setupNavigationUI()
        
        let navView = XZPayMeNavView.loadNavView()
        navView.frame = CGRect(x: 0, y: 0, width: kWindowW, height: DDSafeAreaTopHeight)
        self.view.addSubview(navView)
    }

   
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
}

//MARK:--UI相关方法
extension XZPayMeVC{
    //设置 导航栏
    private func setupNavigationUI(){
        
        navigationItem.title = "我的"
        
    }
    
    
    
}

