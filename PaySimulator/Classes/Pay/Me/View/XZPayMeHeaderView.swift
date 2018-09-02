//
//  XZPayMeHeaderView.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/2.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit




class XZPayMeHeaderView: UIView {
    //MARK:--定义闭包（按钮点击事件，传到控制器中）
    //声明
     var clickHeaderRightBlock : ((_ sender:UIButton) ->())?
    //Xib属性
    
    @IBOutlet weak var iocnImage: UIImageView!//头像
    @IBOutlet weak var starsImage: UIImageView!//会员等级
    @IBOutlet weak var nameLabel: UILabel!//用户名
    @IBOutlet weak var accountLabel: UILabel!//账号
      
    @IBAction func clickRightButton(_ sender: UIButton) {//点击个人信息查看详情
        
        //闭包
        guard let clickHeaderRightBlock = clickHeaderRightBlock else { return  }
        
            clickHeaderRightBlock(sender);
        
    }
    
   
  
    
    
}

//MARK:--xib快速构建类方法
extension XZPayMeHeaderView{
    
    class func loadMyView() ->  XZPayMeHeaderView{
        
        return Bundle.main.loadNibNamed("XZPayMeHeaderView", owner: nil, options: nil)?.last as! XZPayMeHeaderView
        
    }
    
    
    
}


