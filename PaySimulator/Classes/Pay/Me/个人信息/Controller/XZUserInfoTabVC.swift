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

    //MARK:--数据Array
    private lazy var dataList : [String] = {
       return ["头像","昵称","支付宝账号","会员等级"]
    }()
    
    
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
    
}
    // MARK: - Table view data source
extension XZUserInfoTabVC : UITableViewDelegate,UITableViewDataSource{
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: XZPayUserInfoCellID)  as! XZPayUserInfoCell;
        if indexPath.row == 0 {//显示 头像
            cell.detailLabel.isHidden = true;
            cell.iconImage.isHidden = false;
        }else{
            cell.detailLabel.isHidden = false;
            cell.iconImage.isHidden = true;
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
        
    }
   
    
}

