//
//  XZSeeRedPacketTabVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/20.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
let cellIdentifier = "XZSeeRedPacketCell"
class XZSeeRedPacketTabVC: UITableViewController {

    //属性
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var remarkLabel: UILabel!
    
    @IBOutlet weak var bottomBtn: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setupNavBar()
        setupTableView()
    }

   
  
}

//MARK:--UI相关
extension XZSeeRedPacketTabVC{
    
     private func setupNavBar(){
        navigationItem.title = "支付宝红包"
        navBarTintColor = ddColor(230, 221, 157)
        navBarBarTintColor = ddColor(207, 58, 63)//红色
        navBarShadowImageHidden = true
        navBarTitleColor = ddColor(230, 221, 157)//金色
        statusBarStyle = .lightContent
        let leftBtn = XZBaseNavItemBtn(frame: CGRect(x: 0, y: 0, width: 20, height: 20), imgName: "red_fanhui", titleName: "返回")
        leftBtn.setTitleColor(ddColor(230, 221, 157), for: .normal)
        leftBtn.addTarget(self, action: #selector(clickLeftBtn), for: .touchUpInside)
 
        let leftBar = UIBarButtonItem(customView: leftBtn)
 
        navigationItem.leftBarButtonItem = leftBar
    }  
    
    //返回
     @objc func clickLeftBtn(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:--TableViewUI
    func setupTableView(){
        tableView.register(UINib.init(nibName: "XZSeeRedPacketCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}


//MARK:--UITableViewDelegate
extension XZSeeRedPacketTabVC{
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! XZSeeRedPacketCell
        
        cell.iconImg.image = UIImage(named: "icon_xiaochengxu")
        return cell
     }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kWindowW, height: 35))
        let label = UILabel(frame:.zero )
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "1人领取，共15元"
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(14)
            make.top.bottom.right.equalTo(view)
        }
        return view
    }
 
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001;
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }

}


