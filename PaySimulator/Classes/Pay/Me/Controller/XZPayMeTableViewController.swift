//
//  XZPayMeTableViewController.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/2.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayMeTableViewController: UITableViewController {

    //MARK:--  //设置table下拉蓝色背景
    var bjBlueImgView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置table下拉蓝色背景
        addBluebackGroundView()
     
    }
 
}
//MARK:--setupUI
extension XZPayMeTableViewController{
    func addBluebackGroundView(){
        bjBlueImgView = UIImageView(image: UIImage(named: "navBlue"))
        bjBlueImgView?.frame = CGRect(x: 0, y: 0, width: kWindowW, height: 0);
        bjBlueImgView?.contentMode = .scaleAspectFill
        tableView.addSubview(bjBlueImgView!)
    }
}


//MARK:--TableViewDataSource
extension XZPayMeTableViewController{
    
    //分区高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return  75
        }
        
        return 10
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = XZPayMeHeaderView.loadMyView()
            
            headerView.clickHeaderRightBlock = {[weak self] (sender : UIButton) in//推出用户详情控制器
                let  meUserInfoVC = XZUserInfoTabVC()
                self!.navigationController?.pushViewController(meUserInfoVC, animated: true)
                
            }
            return headerView
        }
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

