//
//  XZReceivablesFooterView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/5.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZReceivablesFooterView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//MARK:--xib快速构建类方法
extension XZReceivablesFooterView{
    
    class func loadMyView() ->  XZReceivablesFooterView{
        return Bundle.main.loadNibNamed("XZReceivablesFooterView", owner: nil, options: nil)?.last as! XZReceivablesFooterView
        
    }
}
