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

class XZUserInfoTabVC: XZBaseVC {

    //MARK:--数据源Array
    private lazy var dataList : [String] = {
       return ["头像","昵称","支付宝账号","会员等级"]
    }()
    private var rightBtn : UIButton?
    private var isEditingUserinfo: Bool = false{
        didSet{
            rightBtn?.isHidden = !isEditingUserinfo
            self.myTableView.reloadData()
        }
    }
    //用户名
    private var  userNameLB : UILabel?
    //支付宝账号
    private var  payAccountLB : UILabel?
    
    private var currentIndexPathArray : [IndexPath] = {
        let firstIndex = IndexPath(row: 1, section: 0);
        let secondIndex = IndexPath(row: 2, section: 0)
        return  [firstIndex,secondIndex]
    }()
    private var iconImage : UIImageView?
    
    private lazy var myTableView : UITableView = {[weak self] in
        let myTableView = UITableView(frame: CGRect.zero, style: .grouped);
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.register(UINib.init(nibName: "XZPayUserInfoCell", bundle: nil), forCellReuseIdentifier: XZPayUserInfoCellID)
        return myTableView;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            make.edges.equalTo(self.view);
        }
    }
    
    
    //导航栏右侧按钮
    private func setupNavBtn(){
        
        rightBtn = UIButton()
        rightBtn?.setTitleColor(UIColor.white, for: .normal);
        rightBtn?.setTitle("确定", for: .normal);
        rightBtn?.addTarget(self, action: #selector(rightBtnClick(sender:)), for: .touchUpInside)
        rightBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 15);
        rightBtn?.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn!)
        rightBtn?.isHidden = !isEditingUserinfo
        
    }
    
    @objc private func rightBtnClick(sender:UIButton){
        
        isEditingUserinfo  = false
        myTableView.reloadData()
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
        if indexPath.row == 0 {//显示头像
            cell.detailLabel.isHidden = true;
            
            cell.iconImage.isHidden = false;
             iconImage = cell.iconImage
            let userInfo = XZUserHelper.getUserInfo();
            
            guard let userImg = userInfo.iconImage else {
                cell.iconImage.image = UIImage(named: "baidu")
                return cell
            }
            let imgData = Data(base64Encoded: userImg)
            
            cell.iconImage.image = UIImage(data: imgData!)
            
           
        }else {
            cell.detailLabel.isHidden = false;
            cell.iconImage.isHidden = true;
        }
  
        if indexPath.row == 1 {//用户名
            self.userNameLB = cell.detailLabel
        }else if indexPath.row == 2{
            self.payAccountLB = cell.detailLabel
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
            }
            self.navigationController?.pushViewController(editVC, animated: true)
            
         
        }else if indexPath.row == 2{//修改账号
            
            let editVC = XZEditUserInfoVC()
            editVC.textField.text = self.userNameLB?.text
            editVC.navigationItem.title = "修改账号"
            self.navigationController?.pushViewController(editVC, animated: true)
            
        }else{//除了 头像 的cell
            
            
        }
        
        
    }
   
    
}

//MARK:--相机相册代理方法
extension XZUserInfoTabVC : XZMyPhotoManageDelegate {
    
    func uploadImage(myImage: UIImage) {
        iconImage?.image = myImage
        //取到数据存储
        let userInfo = XZUserHelper.sharedUserHelper;
        let imgData = UIImagePNGRepresentation(myImage)
        let imgStr = imgData?.base64EncodedString()
        userInfo.iconImage = imgStr!;
        userInfo.savrUserInfo()
        
        
    }
    
    
}

