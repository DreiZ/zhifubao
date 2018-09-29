//
//  XZPayMeTableViewController.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/2.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayMeTableViewController: UITableViewController {

    
    var userModel : XZUserModel?

    //MARK:--定义闭包（按钮点击事件，传到控制器中）
    var clickHeaderRightBlock : ((_ sender:UIButton) ->())?
    //Xib属性
    @IBOutlet weak var iconImage: UIImageView!//头像
    @IBOutlet weak var starsImage: UIImageView!//会员等级
    @IBOutlet weak var nameLabel: UILabel!//用户名
    @IBOutlet weak var accountLabel: UILabel!//账号
    
    @IBOutlet weak var headerView: UIView!
    @IBAction func clickRightButton(_ sender: UIButton) {//点击个人信息查看详情
        
        let  meUserInfoVC = XZUserInfoTabVC()
        self.navigationController?.pushViewController(meUserInfoVC, animated: true)
        
    }
    
    
    //MARK:--  //设置table下拉蓝色背景
    var bjBlueImgView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userModel = XZFriendListModel.shareSingleton.getUserModel()
        
        //设置table下拉蓝色背景
        addBluebackGroundView()
        self.headerView.backgroundColor = ddBlueColor()
 
        iconImage.layer.masksToBounds = true
        iconImage.layer.cornerRadius = 3
        iconImage.layer.borderColor = UIColor(red: 102.0/255.0, green: 167.0/255.0, blue: 223.0/255.0, alpha: 1).cgColor
        iconImage.layer.borderWidth = 1
    }
 
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
        //更新headerView信息
        uploadHeaderViewData()
        
    }
}
//MARK:--setupUI
extension XZPayMeTableViewController{
    private func addBluebackGroundView(){
        bjBlueImgView = UIImageView()
        bjBlueImgView?.backgroundColor = ddBlueColor()
        bjBlueImgView?.frame = CGRect(x: 0, y: 0, width: kWindowW, height: 0);
        bjBlueImgView?.contentMode = .scaleAspectFill
        tableView.addSubview(bjBlueImgView!)
    }
    
    //headerViewx数据更新
    private func uploadHeaderViewData(){
//        let userInfo = XZUserHelper.getUserInfo()
        self.userModel = XZFriendListModel.shareSingleton.getUserModel()
        //姓名
        if let userName = userModel?.trueName  {
            
            self.nameLabel.text = userName
            
        }else{
            self.nameLabel.text = "";
        }
        
        //账号
        if let payAccount = userModel?.aliCount {
            if isPhoneNumber(phoneNumber: payAccount){//手机号
                let phoneStr = payAccount as NSString
                let range = NSMakeRange(3, 5);
                let resultStr = phoneStr.replacingCharacters(in: range, with: "*****")
                self.accountLabel.text = resultStr
                
            }else if isValidateEmail(emal: payAccount){//邮箱
                
                let phoneStr = payAccount as NSString
                let range = NSMakeRange(3, 3);
                let resultStr = phoneStr.replacingCharacters(in: range, with: "***")
                self.accountLabel.text = resultStr
                
            }
        }else{
            self.accountLabel.text = "123456789"
        }
        
        if self.userModel?.level == 0 {
            self.starsImage.isHidden = true
        }else {
            let level = ["", "userleve1", "userleve2", "userleve3", "userleve4"]
            self.starsImage.isHidden = false
            self.starsImage.image = UIImage(named: level[self.userModel?.level ?? 0])
        }
        
        //头像
        guard let userImg = userModel?.headImage else {
            iconImage.image = UIImage(named: "headIcon")
            return;
        }
//        let imgData = Data(base64Encoded: userImg)
//        iconImage.image = UIImage(data: imgData!)
        iconImage.image = userImg
        
     }
    
}


//MARK:--TableViewDataSource
extension XZPayMeTableViewController{
    
    //分区高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    
    //scrollerView滚动方法
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = scrollView.contentOffset
        if point.y < 0 {//向下拖拽
            var bjFrame = self.bjBlueImgView?.frame
            bjFrame?.origin.y = point.y
            bjFrame?.size.height = -point.y
            self.bjBlueImgView?.frame = bjFrame!
        }
    }
    
    
    //MARK:--tableView点击方法
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
