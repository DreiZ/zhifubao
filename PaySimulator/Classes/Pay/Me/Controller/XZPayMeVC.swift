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
        
        
    }

   
 

}

//MARK:--UI相关方法
extension XZPayMeVC{
    //设置 导航栏
    private func setupNavigationUI(){
        
        navigationItem.title = "我的"
        
    }
    
    
    
}

