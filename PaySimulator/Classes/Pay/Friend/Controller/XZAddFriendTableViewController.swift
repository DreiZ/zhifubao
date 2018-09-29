//
//  XZAddFriendTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/20.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZAddFriendTableViewController: UITableViewController {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var trueNameTextField: UITextField!
    @IBOutlet weak var acountLabel: UITextField!
    @IBOutlet weak var telLabel: UITextField!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var hiddenSwitch: UISwitch!
    
    var level : Int = 0
    
    
    var dataAlert : XZMyAlertSheetView = {
        let dataAlert = XZMyAlertSheetView()
        
        return dataAlert
    }()
    
    let gradeArr : [String] = ["无", "钻石会员", "铂金会员", "黄金会员", "大众会员"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
}

extension XZAddFriendTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let myPhotoManage  = XZMyPhotoManage.sharedPhotoManage
            
            myPhotoManage.showActionSheetInVC(factherVC: self, aDelegate: self as XZMyPhotoManageDelegate)
        }else if indexPath.row == 5 {
            self.dataAlert.title = "会员等级"
            self.dataAlert.setDataArr(dataArr:  gradeArr)
            dataAlert.selectBlock = {(_ selectedIndex : Int) in
               self.level = selectedIndex
                self.levelLabel.text = self.gradeArr[selectedIndex]
            }
            self.dataAlert.showInView(showView: self.view)
        }
    }
}

//MARK:--相机相册代理方法
extension XZAddFriendTableViewController : XZMyPhotoManageDelegate {
    
    func uploadImage(myImage: UIImage) {
       headImageView.image = myImage
    }
}
