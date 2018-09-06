//
//  XZPayMeTableViewController.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/2.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayMeTableViewController: UITableViewController {

    //MARK:--headerView属性
    //MARK:--定义闭包（按钮点击事件，传到控制器中）
    //声明
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
        //设置table下拉蓝色背景
        addBluebackGroundView()
        self.headerView.backgroundColor = ddBlueColor()
 
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
        let userInfo = XZUserHelper.getUserInfo()
 
        //姓名
        if let userName = userInfo.userName  {
            
            self.nameLabel.text = userName
            
        }else{
            self.nameLabel.text = "杨大力";
        }
        
        //账号
        if let payAccount = userInfo.payAccount {
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
        
        //会员等级
        self.starsImage.image = UIImage(named: "icon_xinhao")
        
        //头像
        guard let userImg = userInfo.iconImage else {
            iconImage.image = UIImage(named: "baidu")
            return;
        }
        let imgData = Data(base64Encoded: userImg)
        iconImage.image = UIImage(data: imgData!)
        
        
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
        /*
        if section == 0 {
            let headerView = XZPayMeHeaderView.loadMyView()
            headerView.iconImage.layer.masksToBounds = true
            headerView.iconImage.layer.cornerRadius = 4
            headerView.iconImage.layer.borderColor = UIColor.init(red: 102.0/255.0, green: 167.0/255.0, blue: 223.0/255.0, alpha: 1).cgColor
            
            headerView.clickHeaderRightBlock = {[weak self] (sender : UIButton) in//推出用户详情控制器
                let  meUserInfoVC = XZUserInfoTabVC()
                self!.navigationController?.pushViewController(meUserInfoVC, animated: true)
                
            }
            
            headerView.userInfo = XZUserHelper.getUserInfo()
            
            
            return headerView
        }
 */
        return nil
 
    }
    //cell点击方法
    
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
    
}

