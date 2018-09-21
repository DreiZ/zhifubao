//
//  XZEditRedPacketTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit
import DateTimePicker

class XZEditRedPacketTableViewController: UITableViewController {

    var to : XZUserModel?
    var from : XZUserModel?
    
    //收红包
    @IBOutlet weak var receiveBtn: UIButton!
    //发红包
    @IBOutlet weak var sendBtn: UIButton!
    //金额
    @IBOutlet weak var amountTextFeild: UITextField!
    //备注
    @IBOutlet weak var marketTextFeild: UITextField!
    
    //发红包的人
    @IBOutlet weak var sendNameLabel: UILabel!
    @IBOutlet weak var sendImageView: UIImageView!
    
    //领红包的人
    @IBOutlet weak var receiveNameLabel: UILabel!
    @IBOutlet weak var receiveImageView: UIImageView!
    
    //时间
    @IBOutlet weak var sendTimeLabel: UILabel!
    //头像带+
    @IBOutlet weak var ImageAddSwith: UISwitch!
    
    var isSend : Bool = true
    
    var setMessageData : ((_ : XZMessage)->())?
    var sendDate = Date()
    
    lazy var picker : DateTimePicker = {
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
            self.sendDate = didSelectDate
            self.sendTimeLabel.text = didSelectDate.shortTimeTextOfDate()
        }
        
        picker.dismissHandler = { () in
            self.picker.removeFromSuperview()
        }
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setData()
    }
    
    
    @IBAction func receiveBtnOnClick(_ sender: Any) {
        self.isSend = false
        self.receiveBtn.isSelected = true
        self.sendBtn.isSelected = false
        
        self.sendImageView.image = to?.headImage
        self.sendNameLabel.text = to?.trueName
        
        self.receiveImageView.image = from?.headImage
        self.receiveNameLabel.text = from?.trueName
    }
    
    @IBAction func sendBtnOnClick(_ sender: Any) {
        self.isSend = true
        self.receiveBtn.isSelected = false
        self.sendBtn.isSelected = true
        
        self.sendImageView.image = from?.headImage
        self.sendNameLabel.text = from?.trueName
        
        self.receiveImageView.image = to?.headImage
        self.receiveNameLabel.text = to?.trueName
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && indexPath.row == 2 {
            
            self.view.addSubview(picker)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = kChatBackColor
        return view
    }
}

extension XZEditRedPacketTableViewController  {
    func setupUI () {
        
        receiveBtn.layer.masksToBounds = true
        receiveBtn.layer.cornerRadius = 3
        receiveBtn.layer.borderColor = UIColor(red: 232.0/255.0, green: 232.0/255.0, blue: 232.0/255.0, alpha: 1).cgColor
        receiveBtn.layer.borderWidth = 0.5
        
        receiveBtn.setImage(UIImage.imageWithColor(kChatMainColor), for: .selected)
        receiveBtn.setTitleColor(UIColor.white, for: .selected)
        receiveBtn.setImage(UIImage.imageWithColor(UIColor.white), for: .normal)
        receiveBtn.setTitleColor(kChatMainColor, for: .normal)
        
        sendBtn.layer.masksToBounds = true
        sendBtn.layer.cornerRadius = 3
        sendBtn.layer.borderColor = UIColor(red: 232.0/255.0, green: 232.0/255.0, blue: 232.0/255.0, alpha: 1).cgColor
        sendBtn.layer.borderWidth = 0.5
        
        sendBtn.setImage(UIImage.imageWithColor(kChatMainColor), for: .selected)
        sendBtn.setTitleColor(UIColor.white, for: .selected)
        sendBtn.setImage(UIImage.imageWithColor(UIColor.white), for: .normal)
        sendBtn.setTitleColor(kChatMainColor, for: .normal)
        
        sendBtn.isSelected = true
        
        self.tableView.tableFooterView = self.footerView()
        
       
    }
    
    func setData () {
        self.sendImageView.image = from?.headImage
        self.sendNameLabel.text = from?.trueName
        
        self.receiveImageView.image = to?.headImage
        self.receiveNameLabel.text = to?.trueName
        self.sendTimeLabel.text = self.sendDate.shortTimeTextOfDate()
    }
    
    func footerView () -> UIView {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: kWindowW, height: 70+43))
        footer.backgroundColor = kChatBackColor
        let showBtn = UIButton()
        showBtn.backgroundColor = kChatMainColor
        showBtn.layer.masksToBounds = true
        showBtn.layer.cornerRadius = 4
        showBtn.setTitle("预览效果", for: .normal)
        showBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        showBtn.setTitleColor(UIColor.white, for: .normal)
        showBtn.addTarget(self, action: #selector(clickShowBtn), for: .touchUpInside)
        footer.addSubview(showBtn)
        
        showBtn.snp.makeConstraints { (make ) in
            make.left.equalTo(footer.snp.left).offset(38)
            make.right.equalTo(footer.snp.right).offset(-38)
            make.height.equalTo(43)
            make.bottom.equalTo(footer.snp.bottom)
        }
        
        return footer
    }
}

extension XZEditRedPacketTableViewController {
    
    
   @objc func clickShowBtn(){
    
    if setMessageData != nil {
        let message : XZMessage = XZMessage()
        message.systemTime = self.sendDate
        message.content = self.amountTextFeild.text
        message.transferMark = self.marketTextFeild.text
        self.setMessageData!(message)
        
        self.navigationController?.popViewController(animated: true)
        return
    }
    
    let seeRedPacketTabVC = UIStoryboard(name: "RedPacket", bundle: nil).instantiateViewController(withIdentifier: "XZSeeRedPacketTabVC") as? XZSeeRedPacketTabVC
    self.navigationController?.pushViewController(seeRedPacketTabVC!, animated: true)
    
    
    }
    
}
