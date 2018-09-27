//
//  XZUserInfoTabVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/2.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
import SnapKit

private let XZPayUserInfoCellID = "XZPayUserInfoCellID";

class XZUserInfoTabVC: XZBaseViewController {

    var userModel : XZUserModel?
    
    //MARK:--数据源Array
    private lazy var dataList : [String] = {
       return ["头像","昵称","支付宝账号","会员等级"]
    }()
 
    //用户名
    private var  userNameLB : UILabel?
    //支付宝账号
    private var  payAccountLB : UILabel?
    //会员等级
    private var  starsLevel : UILabel?
    //头像base64Str
    private var iconImageStr : String?
   //头像
    private var iconImage : UIImageView?
    //懒加载pickerView
    private lazy var myPickerView : XZMyPickerView = {[weak self] in
        
        let  myPickerView = XZMyPickerView(frame:CGRect(x: 0, y: 0, width: kWindowW, height: kWindowH))
        myPickerView.componentsArray = [["无", "钻石会员", "铂金会员", "黄金会员", "大众会员"]]
        myPickerView.clickFinishBlock = {[weak self] (selectorStr : String) in
            let userInfo = XZUserHelper.getUserInfo()
            userInfo.VIPLevel = selectorStr
            userInfo.saveUserInfo()
            self?.starsLevel?.text = selectorStr
            
        }
        return myPickerView
    }()
    //懒加载tableView
    private lazy var myTableView : UITableView = {[weak self] in
        let myTableView = UITableView(frame: CGRect.zero, style: .grouped);
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.register(UINib.init(nibName: "XZPayUserInfoCell", bundle: nil), forCellReuseIdentifier: XZPayUserInfoCellID)
        
        return myTableView;
    }()
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        self.userModel = XZFriendListModel.shareSingleton.getUserModel()
        //设置UI
        setupUI()
        //设置nav右侧按钮
       setupNavBtn()
        
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    
}
//MARK:--UI相关
extension XZUserInfoTabVC{
    
    private func setupUI() ->(){
        view.addSubview(myTableView);
        myTableView.snp.makeConstraints { (make) in
            make.right.left.bottom.equalTo(view)
            make.top.equalTo(DDSafeAreaTopHeight);
        }
    }
    
    
    //导航栏右侧按钮
    
    
    
    private func setupNavBtn(){
        
        self.navBar.title = "个人信息"
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
        self.navBar.onClickRightButton = {[weak self] in 
 
//            //储存用户信息
//            let userInfo = XZUserHelper.getUserInfo()
//            if (self?.iconImageStr) != nil{
//                userInfo.iconImage = self?.iconImageStr//储存头像
//            }
//
//            userInfo.userName = self?.userNameLB?.text//姓名
//            userInfo.payAccount = self?.payAccountLB?.text//账号
//            userInfo.VIPLevel = self?.starsLevel?.text//等级
//            userInfo.saveUserInfo()//保存
////            self?.navigationController?.popViewController(animated: true)
//
//
            
            let userModel : XZUserModel = XZUserModel()
            userModel.userId = 9999
            userModel.headImage = self?.iconImage?.image
            userModel.nickName = self?.userNameLB?.text
            userModel.trueName = self?.userNameLB?.text
            
            userModel.aliCount = self?.payAccountLB?.text
            userModel.isHiddenTureName = false
            
            XZFriendListModel.shareSingleton.addSelfUserModel(userModel)
            let saveStatus = XZFriendListModel.shareSingleton.saveSelfToDB()
            if saveStatus {
                self?.navigationController?.popViewController(animated: true)
            }else{
                XZPublicTools.shareSingleton.showError(subTitle: "添加失败")
            }
        }
    }
}
    // MARK: - Table view data source
extension XZUserInfoTabVC : UITableViewDelegate,UITableViewDataSource{
    
    // cessds 
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: XZPayUserInfoCellID)  as! XZPayUserInfoCell;
        
        //用户信息
//          let userInfo = XZUserHelper.getUserInfo();
        
        if indexPath.row == 0 {//显示头像
            cell.detailLabel.isHidden = true;
            
            cell.iconImage.isHidden = false;
             iconImage = cell.iconImage
          
            
            guard let userImg = userModel?.headImage else {
                cell.iconImage.image = UIImage(named: "headIcon")
                return cell
            }
//            let imgData = Data(base64Encoded: userImg)
            
            cell.iconImage.image = userImg
            
           
        }else {
            cell.detailLabel.isHidden = false;
            cell.iconImage.isHidden = true;
        }
  
        if indexPath.row == 1 {//用户名
            self.userNameLB = cell.detailLabel
            self.userNameLB?.text = userModel?.trueName ?? ""
            
        }else if indexPath.row == 2{//账号
            self.payAccountLB = cell.detailLabel
            self.payAccountLB?.text = userModel?.aliCount ?? ""
        }else if indexPath.row == 3{//会员等级
            self.starsLevel = cell.detailLabel
            let level = ["无", "钻石会员", "铂金会员", "黄金会员", "大众会员"]
            
            self.starsLevel?.text = level[(userModel?.level) ?? 0]
        }
       
        cell.titleLabel.text = dataList[indexPath.row];
       
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20;
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
 //cell点击代理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
        if indexPath.row == 0 {//修改头像
            
            let myPhotoManage  = XZMyPhotoManage.sharedPhotoManage
            
            myPhotoManage.showActionSheetInVC(factherVC: self, aDelegate: self as XZMyPhotoManageDelegate)
            
            
        }else if indexPath.row == 1{//修改昵称
 
            let editVC = XZEditUserInfoVC()
            editVC.textField.text = self.userNameLB?.text
            editVC.navigationItem.title = "修改姓名"
            editVC.postValueBlock = {  [weak  self] (value : String) in
                
                self?.userNameLB?.text = value
                let userInfo = XZUserHelper.getUserInfo()
                 userInfo.userName = value
                 userInfo.saveUserInfo()
                 tableView.reloadData()
            }
            self.navigationController?.pushViewController(editVC, animated: true)
            
         
        }else if indexPath.row == 2{//修改账号
            
            let editVC = XZEditUserInfoVC()
            editVC.textField.text = self.payAccountLB?.text
            editVC.postValueBlock = {  [weak  self] (value : String) in
                
                self?.payAccountLB?.text = value
                let userInfo = XZUserHelper.getUserInfo()
                userInfo.payAccount = value
                userInfo.saveUserInfo()
                tableView.reloadData()
            }
            editVC.navigationItem.title = "修改账号"
            
            self.navigationController?.pushViewController(editVC, animated: true)
            
        }else  if indexPath.row == 3{//修改会员等级
            let widonw = UIApplication.shared.keyWindow
            
            myPickerView.pickerShow(superView: widonw)
            
        }
        
        
    }
   
    
}

//MARK:--相机相册代理方法
extension XZUserInfoTabVC : XZMyPhotoManageDelegate {
    
    func uploadImage(myImage: UIImage) {
        iconImage?.image = myImage
        //取到数据存储
//        let userInfo = XZUserHelper.sharedUserHelper;
        let imgData = UIImagePNGRepresentation(myImage)
        let imgStr = imgData?.base64EncodedString()
        
        self.iconImageStr = imgStr;
        
//        userInfo.iconImage = imgStr!;
//        userInfo.saveUserInfo()
        
        
    }
    
    
}

