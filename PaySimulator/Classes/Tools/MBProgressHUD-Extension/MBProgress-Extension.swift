//
//  MBProgress-Extension.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import Foundation


extension MBProgressHUD {
    
    //MARK:--成功提示
    class func showSuccess(_ titleStr : String ,toView:UIView?) {
        
        var showToView :  UIView
        
        if  toView == nil {
            showToView = viewToshow()
        }else{
            showToView = toView!
        }
        
        let hud = MBProgressHUD.showAdded(to: showToView, animated: true)
 
        hud.label.text = titleStr;
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1.2)
        
    }
    
    
     //MARK:--失败提示
    class func showError(_ titleStr : String ,toView:UIView?) {
        
        var showToView :  UIView
        
        if  toView == nil {
            showToView = viewToshow()
        }else{
            showToView = toView!
        }
        
        let hud = MBProgressHUD.showAdded(to: showToView, animated: true)
        
        hud.label.text = titleStr;
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1.2)
        
    }
    
    //MARK:--显示普通加载信息
    
    
    
    
    //私有方法，获取显示MB的view
    private class func viewToshow() ->  UIView{
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindowLevelNormal{
            let windowArray = UIApplication.shared.windows
            for tempWindow in windowArray{
                if tempWindow.windowLevel == UIWindowLevelNormal{
                    window = tempWindow
                    break
                }
            }
            
        }
        return window!
        
    }
    
    
    
}


