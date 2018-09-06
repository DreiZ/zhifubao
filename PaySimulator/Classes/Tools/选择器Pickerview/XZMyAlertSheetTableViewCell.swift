//
//  XZMyAlertSheetTableViewCell.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/6.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZMyAlertSheetTableViewCell: UITableViewCell {
    
    var title : String?
    var isSelect : Bool = false
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 17.0)
        return titleLabel
    }()
    
    lazy var selectImageView : UIImageView = {
        let selectImageView = UIImageView()
        selectImageView.image = UIImage(named: "shoukuan_icon_back_default")
        selectImageView.contentMode = UIViewContentMode.scaleAspectFit
        return selectImageView
    }()

    func setTitle(title : String) {
        self.title = title
        self.titleLabel.text = title
    }
    
    func setIselect (isSelect : Bool) {
        self.isSelect = isSelect
        self.selectImageView.image = isSelect ? UIImage(named: "shoukuan_icon_back_default"):nil
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension XZMyAlertSheetTableViewCell {
    func setupUI ()  {
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.addSubview(self.titleLabel)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(15)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        self.addSubview(self.selectImageView)
        
        self.selectImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.right.equalTo(self.snp.right).offset(-17)
        }
        
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = ddColor(232.0, 232.0, 232.0)
        self.addSubview(bottomLineView)
        
        bottomLineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(15)
            make.right.equalTo(self.snp.right).offset(-17)
            make.height.equalTo(0.5)
        }
    }
}

extension XZMyAlertSheetTableViewCell {
    class func zz_cell(tableview : UITableView) -> XZMyAlertSheetTableViewCell {
        let identifier = "XZMyAlertSheetTableViewCell"
        
        let cell : XZMyAlertSheetTableViewCell? = tableview.dequeueReusableCell(withIdentifier: identifier) as? XZMyAlertSheetTableViewCell
        
        if cell == nil {
            tableview.register(XZMyAlertSheetTableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
            return XZMyAlertSheetTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
}
