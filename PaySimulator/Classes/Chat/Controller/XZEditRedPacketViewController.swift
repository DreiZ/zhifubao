//
//  XZEditRedPacketViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit


class XZEditRedPacketViewController:  XZBaseViewController {
    
    var tableViewController : XZEditRedPacketTableViewController?
    var setMessageData : ((_ : XZMessage)->())?
    var to : XZUserModel?
    var from : XZUserModel?

    @IBOutlet weak var topContainer: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.topContainer.constant = 44 + 10
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "redPacketToTableView" {
            let iTabelViewController : XZEditRedPacketTableViewController = segue.destination as! XZEditRedPacketTableViewController
            self.tableViewController = iTabelViewController
            iTabelViewController.to = self.to
            iTabelViewController.from = self.from
            iTabelViewController.setMessageData = {(message : XZMessage) in
                if self.setMessageData != nil {
                    self.setMessageData!(message)
                }
            }
        }
    }
}
