//
//  XZPayMeNavView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/5.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayMeNavView: UIView {


}

extension XZPayMeNavView {
    class func loadNavView() -> XZPayMeNavView {
        return Bundle.main.loadNibNamed("XZPayMeNavView", owner: nil, options: nil)?.last as! XZPayMeNavView
    }
}




