//
//  XZReceivablesViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/5.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZReceivablesViewController: XZBaseViewController {

    @IBOutlet weak var contView: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        
    }
}


extension XZReceivablesViewController {
    func setupUI(){
        self.navBar.title = "收款账单"
        
        self.contView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(DDSafeAreaTopHeight)
        }
    }
}

