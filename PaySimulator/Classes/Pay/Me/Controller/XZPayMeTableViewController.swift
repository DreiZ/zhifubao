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

    @IBOutlet weak var headView: UIView!
    //MARK:--定义闭包（按钮点击事件，传到控制器中）
    var clickHeaderRightBlock : ((_ sender:UIButton) ->())?
    //Xib属性
    @IBOutlet weak var acountbackView: UIView!
    @IBOutlet weak var iconImage: UIImageView!//头像
    @IBOutlet weak var starsImage: UIImageView!//会员等级
    @IBOutlet weak var nameLabel: UILabel!//用户名
    @IBOutlet weak var accountLabel: UILabel!//账号
    @IBOutlet weak var redHint: UIView!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var titleLabel3: UILabel!
    @IBOutlet weak var titleLabel4: UILabel!
    @IBOutlet weak var titleLabel5: UILabel!
    @IBOutlet weak var titleLabel6: UILabel!
    @IBOutlet weak var titleLabel7: UILabel!
    @IBOutlet weak var titleLabel8: UILabel!
    @IBOutlet weak var titleLabel9: UILabel!
    @IBOutlet weak var titleLabel10: UILabel!
    @IBOutlet weak var titleLabel11: UILabel!
    @IBOutlet weak var titleLabel12: UILabel!
    @IBOutlet weak var titleLabel13: UILabel!
    @IBOutlet weak var titleLabel14: UILabel!
    @IBOutlet weak var rightHintLabel1: UILabel!
    @IBOutlet weak var rightHintLabel2: UILabel!
    
    
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
        
 
        redHint.layer.masksToBounds = true
        redHint.layer.cornerRadius = 5
        
        iconImage.layer.masksToBounds = true
        iconImage.layer.cornerRadius = 3
        iconImage.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.75).cgColor
        iconImage.layer.borderWidth = 1
        
        acountbackView.layer.masksToBounds = true
        acountbackView.layer.cornerRadius = 10
        acountbackView.layer.borderWidth = 1
        acountbackView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        acountbackView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.85).cgColor
        
        acountbackView.snp.makeConstraints { (make ) in
            make.center.equalTo(self.accountLabel)
            make.left.equalTo(self.accountLabel.snp.left).offset(-7)
            make.right.equalTo(self.accountLabel.snp.right).offset(7)
            make.height.equalTo(20)
        }
    }
    
    func setFront () {
        if kWindowW == 320 {
            headView.frame = CGRect(x: 0, y: 0, width: kWindowW, height: 78)
            
            nameLabel.font = UIFont.systemFont(ofSize: 17)
            titleLabel1.font = UIFont.systemFont(ofSize: 17)
            titleLabel2.font = UIFont.systemFont(ofSize: 17)
            titleLabel3.font = UIFont.systemFont(ofSize: 17)
            titleLabel4.font = UIFont.systemFont(ofSize: 17)
            titleLabel5.font = UIFont.systemFont(ofSize: 17)
            titleLabel6.font = UIFont.systemFont(ofSize: 17)
            titleLabel7.font = UIFont.systemFont(ofSize: 17)
            titleLabel8.font = UIFont.systemFont(ofSize: 17)
            titleLabel9.font = UIFont.systemFont(ofSize: 17)
            titleLabel10.font = UIFont.systemFont(ofSize: 17)
            titleLabel11.font = UIFont.systemFont(ofSize: 17)
            titleLabel12.font = UIFont.systemFont(ofSize: 17)
            titleLabel13.font = UIFont.systemFont(ofSize: 17)
            titleLabel14.font = UIFont.systemFont(ofSize: 17)
            amountLabel.font = UIFont.systemFont(ofSize: 14)
            rightHintLabel1.font = UIFont.systemFont(ofSize: 14)
            rightHintLabel2.font = UIFont.systemFont(ofSize: 14)
        }
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
        
        amountLabel.text = String(format: "%.2f元", self.userModel?.balance ?? 0.00)
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
        if section == 0 {
            return 0
        }
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        return UIView()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if kWindowW == 320 {
            return 47
        }
        return 40
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
