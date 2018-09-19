//
//  XZSystemTimeViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
import DateTimePicker

class XZSystemTimeViewController: XZBaseViewController {
    
    var selectDate : Date = Date()

    lazy var yearLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center

        return label
    }()
    
    lazy var monthLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        
        return label
    }()
    
    lazy var dayLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        
        return label
    }()
    
    lazy var hourLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        
        return label
    }()
    
    lazy var minuteLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        
        return label
    }()
    
    
    func getSpaceView() -> UIView {
        let spaceView = UIView()
        spaceView.backgroundColor = kLineColor
        
        return spaceView
    }
    
    func setDate () {
        self.yearLabel.text = XZMessageHelper.getTime(time: Int(selectDate.timeIntervalSince1970), format: "YYYY年")
        self.monthLabel.text = XZMessageHelper.getTime(time: Int(selectDate.timeIntervalSince1970), format: "MM月")
        self.dayLabel.text = XZMessageHelper.getTime(time: Int(selectDate.timeIntervalSince1970), format: "dd日")
        self.hourLabel.text = XZMessageHelper.getTime(time: Int(selectDate.timeIntervalSince1970), format: "HH时")
        self.minuteLabel.text = XZMessageHelper.getTime(time: Int(selectDate.timeIntervalSince1970), format: "mm分")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.setDate()
    }
}

extension XZSystemTimeViewController {
    func setupUI () {
        self.view.backgroundColor = kChatBackColor
        
        self.navBar.title = "设置"
        self.navBar.titleLabelColor = UIColor.white
        self.navBar.barBackgroundColor = ddBlueColor()
        self.navBar.wr_setLeftButton(normalImage: UIImage(named: "icon_fanhui")!, highlightedImage: UIImage(named: "icon_fanhui")!, title: "    ", titleColor: UIColor.white)
        self.navBar.wr_setRightButton(title: "确定", titleColor: ddBlueColor())
        
        
        let topBackView = UIView()
        topBackView.backgroundColor = UIColor.white
        self.view.addSubview(topBackView)
        topBackView.snp.makeConstraints { (make ) in
            make.top.equalTo(self.view.snp.top).offset(DDSafeAreaTopHeight + 10)
            make.left.right.equalToSuperview()
            make.height.equalTo(94)
        }
        
        topBackView.addSubview(self.yearLabel)
        topBackView.addSubview(self.monthLabel)
        topBackView.addSubview(self.dayLabel)
        topBackView.addSubview(self.hourLabel)
        topBackView.addSubview(self.minuteLabel)
        
        self.yearLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(topBackView.snp.left)
            make.centerY.equalTo(topBackView.snp.centerY)
            make.width.equalTo(212.0/750.0 * kWindowW)
        }
        
        let spaceLineView = self.getSpaceView()
        topBackView.addSubview(spaceLineView)
        spaceLineView.snp.makeConstraints { (make ) in
            make.left.equalTo(self.yearLabel.snp.right)
            make.centerY.equalTo(topBackView.snp.centerY)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        
        self.monthLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(self.yearLabel.snp.right)
            make.centerY.equalTo(self.yearLabel.snp.centerY)
            make.width.equalTo(538.0/750.0/4.0 * kWindowW)
        }
        
        let spaceLineView1 = self.getSpaceView()
        topBackView.addSubview(spaceLineView1)
        spaceLineView1.snp.makeConstraints { (make ) in
            make.left.equalTo(self.monthLabel.snp.right)
            make.centerY.equalTo(topBackView.snp.centerY)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        self.dayLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(self.monthLabel.snp.right)
            make.centerY.equalTo(self.monthLabel.snp.centerY)
            make.width.equalTo(538.0/750.0/4.0 * kWindowW)
        }
        
        let spaceLineView2 = self.getSpaceView()
        topBackView.addSubview(spaceLineView2)
        spaceLineView2.snp.makeConstraints { (make ) in
            make.left.equalTo(self.dayLabel.snp.right)
            make.centerY.equalTo(topBackView.snp.centerY)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        self.hourLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(self.dayLabel.snp.right)
            make.centerY.equalTo(self.monthLabel.snp.centerY)
            make.width.equalTo(538.0/750.0/4.0 * kWindowW)
        }
        
        let spaceLineView3 = self.getSpaceView()
        topBackView.addSubview(spaceLineView3)
        spaceLineView3.snp.makeConstraints { (make ) in
            make.left.equalTo(self.hourLabel.snp.right)
            make.centerY.equalTo(topBackView.snp.centerY)
            make.width.equalTo(1)
            make.height.equalTo(40)
        }
        
        self.minuteLabel.snp.makeConstraints { (make ) in
            make.left.equalTo(self.hourLabel.snp.right)
            make.centerY.equalTo(self.hourLabel.snp.centerY)
            make.width.equalTo(538.0/750.0/4.0 * kWindowW)
        }
        
        
        let min = Date().addingTimeInterval(-60 * 60 * 24 * 365 * 5)
        let max = Date().addingTimeInterval(60 * 60 * 24 * 4)
        let picker = DateTimePicker.create(minimumDate: min, maximumDate: max)
        picker.highlightColor = ddBlueColor()
        picker.cancelButtonTitle = "取消"
        picker.doneButtonTitle = "确定"
        picker.todayButtonTitle = "今天"
        picker.dateFormat = "YYYY/MM/dd HH:mm"
        picker.frame = CGRect(x: 0, y: kWindowH - picker.frame.size.height, width: picker.frame.size.width, height: picker.frame.size.height)
  
        picker.completionHandler = {(didSelectDate : Date) in
            self.selectDate = didSelectDate
            self.setDate()
        }
        self.view.addSubview(picker)
    }
}

