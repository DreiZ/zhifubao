//
//  XZChatTranferViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatTranferViewController: XZBaseViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupUI()
    }


    @IBAction func cancleBtnOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension XZChatTranferViewController {
    func setupUI () {
        self.navBar.isHidden = true
        topConstraint.constant = 0
    }
}
