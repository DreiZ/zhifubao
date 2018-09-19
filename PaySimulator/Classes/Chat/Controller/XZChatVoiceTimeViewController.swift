//
//  XZChatVoiceTimeViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatVoiceTimeViewController: XZBaseViewController {
    
    var setMessageData : ((_ : XZMessageModel)->())?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupUI()
    }
}

extension XZChatVoiceTimeViewController {
    func setupUI () {
        self.navBar.title = "设置"
    }
}
