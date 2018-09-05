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
    @IBOutlet weak var iconImage: UIImageView!//头像
    @IBOutlet weak var starsImage: UIImageView!//会员等级
    @IBOutlet weak var nameLabel: UILabel!//用户名
    @IBOutlet weak var accountLabel: UILabel!//账号
    @IBAction func clickRightButton(_ sender: UIButton) {//点击个人信息查看详情
        
        //闭包
        guard let clickHeaderRightBlock = clickHeaderRightBlock else { return  }
        
        clickHeaderRightBlock(sender);
        
    }
    
    //自定义属性
    var userInfo : XZUserHelper?{
        didSet{
            
            guard let userInfo = userInfo else {
                return
            }
            
            
            
            //姓名
            if let userName = userInfo.userName  {
                
                self.nameLabel.text = userName
                
            }else{
                self.nameLabel.text = "杨大力";
            }
            
            //账号
            if let payAccount = userInfo.payAccount {
                if isPhoneNumber(phoneNumber: payAccount){//手机号
                    let phoneStr = payAccount as NSString
                    let range = NSMakeRange(3, 5);
                    let resultStr = phoneStr.replacingCharacters(in: range, with: "*****")
                    self.accountLabel.text = resultStr
                    
                }else if isValidateEmail(emal: payAccount){//邮箱
                    
                    let phoneStr = payAccount as NSString
                    let range = NSMakeRange(3, 3);
                    let resultStr = phoneStr.replacingCharacters(in: range, with: "***")
                    self.accountLabel.text = resultStr
                    
                }
            }else{
                self.accountLabel.text = "123456789"
            }
            
            
            
            //会员等级
            self.starsImage.image = UIImage(named: "icon_xinhao")
            
            //头像
            guard let userImg = userInfo.iconImage else {
                iconImage.image = UIImage(named: "baidu")
                return;
            }
            let imgData = Data(base64Encoded: userImg)
            iconImage.image = UIImage(data: imgData!)
            
            
        }
    }
    
    
}

//MARK:--xib快速构建类方法
extension XZPayMeHeaderView{
    
    class func loadMyView() ->  XZPayMeHeaderView{
        
        return Bundle.main.loadNibNamed("XZPayMeHeaderView", owner: nil, options: nil)?.last as! XZPayMeHeaderView
        
    }
    
    
    
}



