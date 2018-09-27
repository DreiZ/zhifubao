//
//  XZEditRedPacketTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit


class XZEditRedPacketTableViewController: UITableViewController {

    //单独生成红包
    var redPacket : XZRedPacketModel?
    
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
    
    
    override func viewWillDisappear(_ animated: Bool) {
        marketTextFeild.resignFirstResponder()
        amountTextFeild.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setData()
    }
    
    
    @IBAction func receiveBtnOnClick(_ sender: Any) {
        self.isSend = false
        self.receiveBtn.isSelected = true
        self.sendBtn.isSelected = false
        
        guard let redBacketModel = self.redPacket else {
            self.sendImageView.image = to?.headImage
            self.sendNameLabel.text = to?.trueName
            
            self.receiveImageView.image = from?.headImage
            self.receiveNameLabel.text = from?.trueName
            return
        }
        self.sendImageView.image = redBacketModel.toUser?.headImage
        self.sendNameLabel.text = redBacketModel.toUser?.trueName
        
        self.receiveImageView.image = redBacketModel.fromUser?.headImage
        self.receiveNameLabel.text = redBacketModel.fromUser?.trueName
        
        let tempUser = redBacketModel.toUser
        redBacketModel.toUser = redBacketModel.fromUser
        redBacketModel.fromUser = tempUser
    }
    
    @IBAction func sendBtnOnClick(_ sender: Any) {
        self.isSend = true
        self.receiveBtn.isSelected = false
        self.sendBtn.isSelected = true
        
        guard let redBacketModel = self.redPacket else {
            self.sendImageView.image = from?.headImage
            self.sendNameLabel.text = from?.trueName
            
            self.receiveImageView.image = to?.headImage
            self.receiveNameLabel.text = to?.trueName
            return
        }
        self.sendImageView.image = redBacketModel.toUser?.headImage
        self.sendNameLabel.text = redBacketModel.toUser?.trueName
        
        self.receiveImageView.image = redBacketModel.fromUser?.headImage
        self.receiveNameLabel.text = redBacketModel.fromUser?.trueName
        let tempUser = redBacketModel.toUser
        redBacketModel.toUser = redBacketModel.fromUser
        redBacketModel.fromUser = tempUser
    }
   
    //MARK: ------tableview------------------------------
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.section == 1 && indexPath.row == 2 {
            marketTextFeild.resignFirstResponder()
            amountTextFeild.resignFirstResponder()
            let spicker = HcdDateTimePickerView(datePickerMode: DatePickerDateTimeMode, defaultDateTime: Date())
            spicker?.topViewColor = kChatMainColor

            spicker?.clickedOkBtn = {(dateTimeStr : String?) in
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-M-d HH:mm:ss"
                let tempDate = formatter.date(from: dateTimeStr!)
                self.sendDate = tempDate ?? Date()
                self.sendTimeLabel.text = self.sendDate.shortTimeTextOfDate()
                
                guard let redBacketModel = self.redPacket else {
                    return
                }
                redBacketModel.time = self.sendDate
//                self.redPacket?.time = self.sendDate
            }

            self.view.addSubview(spicker!)
            spicker?.showHcdDateTimePicker()
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                guard let redBacketModel = self.redPacket else {
                    return
                }
                let addressBookVC = UIStoryboard(name: "PayFriend", bundle: nil).instantiateViewController(withIdentifier: "XZAddressBookVC") as? XZAddressBookVC
                addressBookVC?.selectUserBlock = {(user : XZUserModel) in
                    redBacketModel.fromUser = user
                    self.setData()
                }
                self.navigationController?.pushViewController(addressBookVC!, animated: true)
            }else if indexPath.row == 1 {
                guard let redBacketModel = self.redPacket else {
                    return
                }
                let addressBookVC = UIStoryboard(name: "PayFriend", bundle: nil).instantiateViewController(withIdentifier: "XZAddressBookVC") as? XZAddressBookVC
                addressBookVC?.selectUserBlock = {(user : XZUserModel) in
                    redBacketModel.toUser = user
                    self.setData()
                }
                self.navigationController?.pushViewController(addressBookVC!, animated: true)
            }
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
        
        guard let redBacketModel = self.redPacket else {
            self.sendImageView.image = from?.headImage
            self.sendNameLabel.text = from?.trueName
            
            self.receiveImageView.image = to?.headImage
            self.receiveNameLabel.text = to?.trueName
            self.sendTimeLabel.text = self.sendDate.shortTimeTextOfDate()
            return
        }
        
        self.sendImageView.image = redBacketModel.fromUser?.headImage
        self.sendNameLabel.text = redBacketModel.fromUser?.trueName
        
        self.receiveImageView.image = redBacketModel.toUser?.headImage
        self.receiveNameLabel.text = redBacketModel.toUser?.trueName
        self.sendTimeLabel.text = redBacketModel.time?.shortTimeTextOfDate()
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
        message.mark = self.marketTextFeild.text
        message.type = TypeRedPacket
        self.setMessageData!(message)
        
        self.navigationController?.popViewController(animated: true)
        return
        
    }
    
    let seeRedPacketTabVC = UIStoryboard(name: "RedPacket", bundle: nil).instantiateViewController(withIdentifier: "XZSeeRedPacketTabVC") as? XZSeeRedPacketTabVC
        self.redPacket?.amount = self.amountTextFeild.text
        self.redPacket?.mark = self.marketTextFeild.text
        seeRedPacketTabVC?.redPacket = self.redPacket
        self.navigationController?.pushViewController(seeRedPacketTabVC!, animated: true)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}
