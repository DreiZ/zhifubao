//
//  XZReceivablesTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/5.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZReceivablesTableViewController: UITableViewController {

    var tranferModel : XZTranferModel?
    var editType : BillType?
    
    //转入 转出按钮
    @IBOutlet weak var transferTypeLeftBtn: UIButton!
    @IBOutlet weak var transferTypeRightBtn: UIButton!
    
    //交易对象
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var toImageView: UIImageView!
    @IBOutlet weak var toAliAcountTextField: UITextField!
    @IBOutlet weak var AmountTextField: UITextField!
    @IBOutlet weak var markTextField: UITextField!
    @IBOutlet weak var toUserLevel: UILabel!
    @IBOutlet weak var receiveTypeLabel: UILabel!
    @IBOutlet weak var billClassLabel: UILabel!
    @IBOutlet weak var createTimeLabel: UILabel!
    @IBOutlet weak var transferStatus: UILabel!
    @IBOutlet weak var billOrderNO: UITextField!
    @IBOutlet weak var typeCell: UITableViewCell!
    @IBOutlet weak var receiveTitleLabel: UILabel!
    
    let receiveTypeArr : [String] = ["余额", "余额宝", "银行卡"]
    let transactionStateArr : [String] = ["交易成功", "待付款"]
    let gradeArr : [String] = ["无", "钻石会员", "铂金会员", "黄金会员", "大众会员"]
    
    var dataAlert : XZMyAlertSheetView = {
        let dataAlert = XZMyAlertSheetView()
        
        return dataAlert
    }()
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tableView.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setData()
        self.setupUI()
        
        
        self.reloadTableViewData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index \(indexPath.row)")
        self.tableView.endEditing(true)
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                self.dataAlert.title = "选择会员等级"
                self.dataAlert.setDataArr(dataArr: gradeArr)
                dataAlert.selectBlock = {(_ selectedIndex : Int) in
                    self.tranferModel?.toUser?.level = selectedIndex
                    self.reloadTableViewData()
                }
                self.dataAlert.showInView(showView: self.view)
            }else if indexPath.row == 1 {
                if self.tranferModel?.isTransferIn ?? true {
                    self.dataAlert.title = "收款方式"
                }else{
                    self.dataAlert.title = "付款方式"
                }
                
                self.dataAlert.setDataArr(dataArr: receiveTypeArr)
                dataAlert.selectBlock = {(_ selectedIndex : Int) in
                    self.tranferModel?.paymentMethod = self.receiveTypeArr[selectedIndex]
                    self.reloadTableViewData()
                }
                self.dataAlert.showInView(showView: self.view)
            }else if indexPath.row == 2 {
                let  myPickerView = XZMyAlertSheetTextFieldView(frame:CGRect(x: 0, y: 0, width: kWindowW, height: kWindowH))
                myPickerView.doneBlock = {(text : String) in
                    self.tranferModel?.billClass = text
                    self.reloadTableViewData()
                }
                myPickerView.showInView(showView: self.view)
            }else if indexPath.row == 3 {
                let spicker = HcdDateTimePickerView(datePickerMode: DatePickerDateTimeMode, defaultDateTime: Date())
                spicker?.topViewColor = kChatMainColor
                
                spicker?.clickedOkBtn = {(dateTimeStr : String?) in
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-d HH:mm:ss"
                    let tempDate = formatter.date(from: dateTimeStr!)
                    self.tranferModel?.createTime = tempDate

                    self.reloadTableViewData()
                }
                
                self.view.addSubview(spicker!)
                spicker?.showHcdDateTimePicker()
            }else if indexPath.row == 4 {
                self.dataAlert.title = "交易状态"
                self.dataAlert.setDataArr(dataArr: transactionStateArr)
                dataAlert.selectBlock = {(_ selectedIndex : Int) in
                    self.tranferModel?.state = self.transactionStateArr[selectedIndex]
                    self.reloadTableViewData()
                }
                self.dataAlert.showInView(showView: self.view)
            }
        }else if indexPath.section == 0 {
            if indexPath.row == 0 {
                let addressBookVC = UIStoryboard(name: "PayFriend", bundle: nil).instantiateViewController(withIdentifier: "XZAddressBookVC") as? XZAddressBookVC
                addressBookVC?.selectUserBlock = {(user : XZUserModel) in
                    self.tranferModel?.toUser = user
                    self.reloadTableViewData()
                }
                self.navigationController?.pushViewController(addressBookVC!, animated: true)
            }
        }
    }
    
    
    
    @IBAction func transferInOnClick(_ sender: Any) {
        self.tranferModel?.isTransferIn = true
        
        
        if self.tranferModel?.isTransferIn ?? true {
            self.receiveTitleLabel.text = "收款方式"
            self.transferTypeLeftBtn.setTitleColor(UIColor.white, for: .normal)
            self.transferTypeLeftBtn.backgroundColor = kChatMainColor
            
            self.transferTypeRightBtn.setTitleColor(kChatMainColor, for: .normal)
            self.transferTypeRightBtn.backgroundColor = UIColor.white
        }else{
            self.receiveTitleLabel.text = "付款方式"
            self.transferTypeRightBtn.setTitleColor(UIColor.white, for: .normal)
            self.transferTypeRightBtn.backgroundColor = kChatMainColor
            
            self.transferTypeLeftBtn.setTitleColor(kChatMainColor, for: .normal)
            self.transferTypeLeftBtn.backgroundColor = UIColor.white
        }
            
    }
    
    
    @IBAction func transferOutClick(_ sender: Any) {
        self.tranferModel?.isTransferIn = false
        
        if self.tranferModel?.isTransferIn ?? true {
            self.receiveTitleLabel.text = "收款方式"
            self.transferTypeLeftBtn.setTitleColor(UIColor.white, for: .normal)
            self.transferTypeLeftBtn.backgroundColor = kChatMainColor
            
            self.transferTypeRightBtn.setTitleColor(kChatMainColor, for: .normal)
            self.transferTypeRightBtn.backgroundColor = UIColor.white
        }else{
            self.receiveTitleLabel.text = "付款方式"
            self.transferTypeRightBtn.setTitleColor(UIColor.white, for: .normal)
            self.transferTypeRightBtn.backgroundColor = kChatMainColor
            
            self.transferTypeLeftBtn.setTitleColor(kChatMainColor, for: .normal)
            self.transferTypeLeftBtn.backgroundColor = UIColor.white
        }
            
    }
    
    @IBAction func refreshBtnOnClick(_ sender: Any) {
        self.getOrderNo()
    }
    
    
}

extension XZReceivablesTableViewController {
    func setupUI () {
        
        self.transferTypeLeftBtn.layer.masksToBounds = true
        self.transferTypeLeftBtn.layer.cornerRadius = 4
        
        self.transferTypeRightBtn.layer.masksToBounds = true
        self.transferTypeRightBtn.layer.cornerRadius = 4
        self.transferTypeRightBtn.layer.borderColor = ddColorFromHex("e8e8e8").cgColor
        self.transferTypeRightBtn.layer.borderWidth = 1
        
        self.transferTypeLeftBtn.layer.masksToBounds = true
        self.transferTypeLeftBtn.layer.cornerRadius = 4
        self.transferTypeLeftBtn.layer.borderColor = ddColorFromHex("e8e8e8").cgColor
        self.transferTypeLeftBtn.layer.borderWidth = 1
        
        self.setupFooterView()
        
        self.toAliAcountTextField.delegate = self
        self.AmountTextField.delegate = self
        self.markTextField.delegate = self
        
        self.toAliAcountTextField.tag = 0
        self.AmountTextField.tag = 1
        self.markTextField.tag = 2
        
        self.toAliAcountTextField.addTarget(self, action: #selector(textFieldDidChange (textField:)), for: UIControlEvents.editingChanged)
        self.AmountTextField.addTarget(self, action: #selector(textFieldDidChange (textField:)), for: UIControlEvents.editingChanged)
        self.markTextField.addTarget(self, action: #selector(textFieldDidChange (textField:)), for: UIControlEvents.editingChanged)

        self.tableView.keyboardDismissMode = .onDrag
    }
    
    private func setupFooterView() {
        let footer = XZReceivablesFooterView.loadMyView()
        footer.selectBlock = { () in
            if let show = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "XZBillShowViewController") as? XZBillShowViewController{
                show.tranferModel = self.tranferModel
                show.type = self.editType
                self.navigationController?.pushViewController(show, animated: true)
            }
        }
        self.tableView.tableFooterView = footer
    }
    
    func setData () {
        if self.tranferModel == nil {
            self.tranferModel = XZTranferModel()
        }
    }
    
    func reloadTableViewData() {
        if self.tranferModel?.isTransferIn ?? true {
            self.transferTypeLeftBtn.setTitleColor(UIColor.white, for: .normal)
            self.transferTypeLeftBtn.backgroundColor = kChatMainColor
            
            self.transferTypeRightBtn.setTitleColor(kChatMainColor, for: .normal)
            self.transferTypeRightBtn.backgroundColor = UIColor.white
        }else{
            self.transferTypeRightBtn.setTitleColor(UIColor.white, for: .normal)
            self.transferTypeRightBtn.backgroundColor = kChatMainColor
            
            self.transferTypeLeftBtn.setTitleColor(kChatMainColor, for: .normal)
            self.transferTypeLeftBtn.backgroundColor = UIColor.white
        }
        
        self.toImageView.layer.masksToBounds = true
        
        self.nameLabel.text = self.tranferModel?.toUser?.trueName == nil ? "姓名" : self.tranferModel?.toUser?.trueName
            self.toImageView.image = self.tranferModel?.toUser?.headImage == nil ?  UIImage(named: "z_touxiang") : self.tranferModel?.toUser?.headImage
        self.toAliAcountTextField.text = self.tranferModel?.toUser?.aliCount
        self.AmountTextField.text = self.tranferModel?.amount
        self.markTextField.text = self.tranferModel?.mark
        

        self.toUserLevel.text = gradeArr[self.tranferModel?.toUser?.level ?? 0]
        self.receiveTypeLabel.text = self.tranferModel?.paymentMethod
        self.billClassLabel.text = self.tranferModel?.billClass
        self.createTimeLabel.text = self.tranferModel?.createTime?.stringOfDate(formatter:"yyyy-MM-d HH:mm")
        
        self.transferStatus.text = self.tranferModel?.state
        self.billOrderNO.text = self.tranferModel?.billNo
//        @IBOutlet weak var billOrderNo: UILabel!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                if editType! == .Transfer {
                    return 50.0
                }else{
                    return 0.0
                }
            }
        }
        
        return 50
    }
}

//t
extension XZReceivablesTableViewController : UITextFieldDelegate {
    @objc func textFieldDidChange(textField : UITextField) {
        if textField.tag == 0 {
            self.tranferModel?.toUser?.aliCount = textField.text
        }else if textField.tag == 1 {
            self.tranferModel?.amount = textField.text ?? ""
        }else if textField.tag == 2 {
            self.tranferModel?.mark = textField.text
        }
    }
    
    func getOrderNo() {
        var orderNo = (self.tranferModel?.createTime?.stringOfDate(formatter:"yyyyMMdd")) ?? ""
        orderNo = orderNo + "200040011100"
        for _ in ["1","0", "0", "0", "6", "5", "0", "3", "3", "6", "7", "7"] {
            orderNo = orderNo + String(format: "%ld", arc4random() % 10)
        }
        self.tranferModel?.billNo = orderNo
        self.reloadTableViewData()
    }
}
