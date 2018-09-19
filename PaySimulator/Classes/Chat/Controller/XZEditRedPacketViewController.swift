//
//  XZEditRedPacketViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZEditRedPacketViewController:  XZBaseViewController {

    @IBOutlet weak var topContainer: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }

    
}

extension XZEditRedPacketViewController {
    func setupUI () {
        self.setNavigation()
        
        topContainer.constant = DDSafeAreaTopHeight
    }
    
    func setNavigation () {
        self.navBar.title = "红包"
        self.navBar.titleLabelColor = UIColor.black
    }
}
