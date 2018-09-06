//
//  XZMyAlertSheetView.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMyAlertSheetView: UIView{

    var dataArr : [String]?
    
    var title : String = "标题" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    var selectIndex : Int  = 0
    
    var selectBlock : ((_ selectedIndex : Int) -> ())?
    
    
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.text = "标题"
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textAlignment = NSTextAlignment.center
        
        return titleLabel
    }()
    
    lazy var contView : UIView = {
        let contView = UIView()
        contView.backgroundColor = UIColor.white
        return contView
    }()
    
    lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.white
        
        let backBtn = UIButton()
        backBtn.setImage(UIImage(named: "icon-fanhui"), for: .normal)
        backBtn.addTarget(self, action: #selector(dissmissBack), for: .touchUpInside)
        topView.addSubview(backBtn)
        backBtn.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(topView)
            make.width.equalTo(50)
        })
        
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = ddColorFromHex("e8e8e8")
        topView.addSubview(bottomLineView)
        bottomLineView.snp.makeConstraints({ (make) in
            make.left.bottom.right.equalTo(topView)
            make.height.equalTo(1)
        })
        
        topView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints({ (make) in
            make.center.equalTo(topView)
        })
        return topView
    }()
    
    lazy var iTableView : UITableView = {
        let iTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain);
        iTableView.dataSource = self
        iTableView.delegate = self
        iTableView.separatorStyle = .none
        return iTableView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// ui 初始化
extension XZMyAlertSheetView {
    func setupUI() {
        self.backgroundColor = UIColor.init(white: 0.01, alpha: 0.5)
        
        let backBtn = UIButton()
        backBtn.addTarget(self, action: #selector(dissmiss), for: .touchUpInside)
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        self.addSubview(self.contView)
        self.contView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(46 * 2 + 46 + 54)
        }
        
        self.contView.addSubview(self.topView)
        self.topView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self.contView)
            make.height.equalTo(46)
        }
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor.white
        self.contView.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.contView)
            make.height.equalTo(54)
        }
        
        
        self.contView.addSubview(self.iTableView)
        self.iTableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.contView)
            make.top.equalTo(self.topView.snp.bottom)
            make.bottom.equalTo(bottomView.snp.top)
        }
    }
}


//tableView dataSource delegate
extension XZMyAlertSheetView : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = XZMyAlertSheetTableViewCell.zz_cell(tableview: tableView)
        cell.setTitle(title: dataArr?[indexPath.row] ?? "")
        cell.setIselect(isSelect: selectIndex == indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = indexPath.row
        iTableView.reloadData()
        selectBlock?(indexPath.row)
        self.dissmiss()
    }
}


//相关方法
extension XZMyAlertSheetView  {
    
    @objc private func dissmiss() {
        self.removeFromSuperview()
    }
    
    @objc private func dissmissBack() {
        self.removeFromSuperview()
    }
    
    
    func showInView (showView : UIView) {
        self.frame = CGRect(x: 0, y: 0, width: kWindowW, height: kWindowH)
         UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    
   
    func setDataArr (dataArr : [String]) {
        self.dataArr = dataArr

        let count = dataArr.count > 5 ? 5 : dataArr.count
        
        self.contView.snp.remakeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(count * 46 + 46 + 54)
        }
        
        self.iTableView.reloadData()
    }
}
