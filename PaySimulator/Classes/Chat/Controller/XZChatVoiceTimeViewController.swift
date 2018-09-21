//
//  XZChatVoiceTimeViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZChatVoiceTimeViewController: XZBaseViewController {
    
    var setMessageData : ((_ : XZMessage)->())?

    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var voiceSlider: UISlider!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var isReadSwitch: UISwitch!
    
    
    @IBAction func voiceSliderValueChange(_ sender: Any) {
        self.secLabel.text = String(Int(voiceSlider.value)) + "秒"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        
        topConstraint.constant = 44 + 10
        
    }
    
    
}

extension XZChatVoiceTimeViewController {
    func setupUI () {
        self.navBar.title = "设置"
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
    }
    
    override func rightBtnOnClick() {
        if setMessageData != nil {
            let message : XZMessage = XZMessage()
            message.voiceTime = Int(voiceSlider.value)
            message.isVoiceRead = isReadSwitch.isOn
            setMessageData!(message)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
