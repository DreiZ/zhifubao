//
//  XZBankListVC.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/27.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZBankListVC: XZBaseViewController {

    var bankSelect : ((_ bankImage : UIImage, _ bankName : String)->())?
    
    var drawalModel : XZWithdrawalModel?
    
    var titleSoure = ["建设银行", "招商银行", "农业银行", "中国银行"]
    var imageSoure = [UIImage(named: ""), UIImage(named: ""), UIImage(named: ""), UIImage(named: "")]
    
    var iTableView : UITableView = {
        let itableView = UITableView(frame: CGRect(x: 0, y: DDSafeAreaTopHeight, width: kWindowW, height: kWindowH - DDSafeAreaTopHeight), style: UITableViewStyle.plain)
        itableView.separatorStyle = .none
        itableView.backgroundColor = kChatBackColor
        
        return itableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
    }
}

extension XZBankListVC {
    func setupUI () {
        self.navBar.title = "选择银行卡"
        self.navBar.titleLabelColor = UIColor.black

        self.view.backgroundColor = kChatBackColor
        
        self.view.addSubview(self.iTableView)
        self.iTableView.dataSource = self
        self.iTableView.delegate = self
        
        self.iTableView.snp.makeConstraints { (make ) in
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom)
            make.top.equalTo(self.view).offset(DDSafeAreaTopHeight+1)
        }
        
        self.iTableView.reloadData()
    }
}

extension XZBankListVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleSoure.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = titleSoure[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.bankSelect != nil {
            self.bankSelect!(imageSoure[indexPath.row]!, titleSoure[indexPath.row])
        }
    }
}
