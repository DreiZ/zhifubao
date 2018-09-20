//
//  XZAddFriendViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/20.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZAddFriendViewController: XZBaseViewController {

    @IBOutlet weak var contView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var tableViewController : XZAddFriendTableViewController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
    
    override func rightBtnOnClick() {
        
        self.tableViewController?.nickNameTextField.text = "zzz"
    }
}


extension XZAddFriendViewController {
    func setupUI () {
        self.view.backgroundColor = kChatBoxBackColor
        
        topConstraint.constant = 44
        
        self.navBar.title = "添加联系人"
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addFriendToContTableView" {
            let iTabelViewController : XZAddFriendTableViewController = segue.destination as! XZAddFriendTableViewController
            self.tableViewController = iTabelViewController
            
        }
    }
}
