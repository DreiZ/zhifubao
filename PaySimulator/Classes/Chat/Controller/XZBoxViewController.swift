//
//  XZBoxViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/10.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBoxViewController: UIViewController {

    lazy var chatBox : XZChatBoxView = {
        let chatBox = XZChatBoxView()
    
        return chatBox
    }()
    
    lazy var moreView : XZChatBoxMoreView = {
       let moreView = XZChatBoxMoreView()
        
        return moreView
    }()
    
    lazy var faceViwe : XZChatBoxFaceView = {
        let faceView = XZChatBoxFaceView()
        
        return faceView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }


}

extension XZBoxViewController {
    private func setupUI () {
        self.view.backgroundColor = kChatBackColor
        
        self.view.addSubview(self.chatBox)
        self.chatBox.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(kTabBarHeight)
        }
        
        self.view.addSubview(self.moreView)
        self.moreView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(kChatMoreViewHeight)
            make.top.equalTo(self.view.snp.top).offset(50)
        }
    }
}
