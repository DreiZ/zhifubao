//
//  XZChatTranferViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatTranferViewController: XZBaseViewController {
    
    var setMessageData : ((_ : XZMessage)->())?
    var to : XZUserModel?

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var toHeadImageView: UIImageView!
    @IBOutlet weak var toNameLabel: UILabel!
    @IBOutlet weak var toTelLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var markTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        toHeadImageView.image = to?.headImage
        toNameLabel.text = to?.trueName
        toTelLabel.text = to?.tel
        
        
        self.setupUI()
    }


    @IBAction func cancleBtnOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func transferHistoryBtnOnClick(_ sender: Any) {
    }
    
    @IBAction func sureBtnOnClick(_ sender: Any) {
        if setMessageData != nil {
            let message : XZMessage = XZMessage()
            message.content = amountTextField.text
            message.transferMark = markTextField.text
            setMessageData!(message)
        }
        self.navigationController?.popViewController(animated: true)
    }
}

extension XZChatTranferViewController {
    func setupUI () {
        self.navBar.isHidden = true
        topConstraint.constant = 0
    }
}
