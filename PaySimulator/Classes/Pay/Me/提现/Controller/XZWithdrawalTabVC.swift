//
//  XZWithdrawalTabVC.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/7.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZWithdrawalTabVC: UITableViewController {

    //MARK:--storyBoard属性
    
    @IBOutlet weak var chooseBankBtn: UIButton!
    
    @IBOutlet weak var bankImageView: UIImageView!
    @IBOutlet weak var bankNumTF: UITextField!
    
    @IBOutlet weak var cardNameTF: UITextField!
    @IBOutlet weak var drawalMoneyTF: UITextField!
    
    @IBOutlet weak var creatTimeBtn: UIButton!
    
    @IBOutlet weak var endTimeBtn: UIButton!
    
    @IBOutlet weak var orderNumTF: UITextField!
    @IBOutlet weak var refreshBtn: UIButton!
    
    
    @IBOutlet weak var previewBtn: UIButton!
    
    var withDrawaleModel : XZWithdrawalModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previewBtn.layer.cornerRadius = 2;
        previewBtn.layer.masksToBounds = true
        
        self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        self.bankNumTF.tag = 0
        self.cardNameTF.tag = 1
        self.drawalMoneyTF.tag = 2
        self.orderNumTF.tag = 3
        
        self.bankNumTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        self.cardNameTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        self.drawalMoneyTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        self.orderNumTF.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
        
        withDrawaleModel = XZWithdrawalModel()
        withDrawaleModel?.creatTime = Date()
        withDrawaleModel?.endTime = Date()
        
        self.getOrderNo()
        self.reloadTableViewData()
    }

  //MARK:--拦截跳转，传值
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //goXZWithdrawalBillTabVC
        
        if segue.identifier == "XZWithdrawalBillViewController" {
            let vc = segue.destination as! XZWithdrawalBillViewController
           
            //传值
            vc.withDrawaleModel = self.withDrawaleModel
        }
        
    }

    @IBAction func bankOnClick(_ sender: Any) {
        self.keyboardDissmiss()
        let bankListVC = XZBankListVC()
        bankListVC.bankSelect = {(image : UIImage, bankName : String) in
            self.withDrawaleModel?.bankName = bankName
            self.withDrawaleModel?.bankImage = image
            self.reloadTableViewData()
        }
        bankListVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(bankListVC, animated: true)
     }

    @IBAction func orderNoOnClick(_ sender: Any) {
        self.keyboardDissmiss()
        self.getOrderNo()
    }
    
    @IBAction func creatTimeOnClick(_ sender: Any) {
        self.keyboardDissmiss()
        let spicker = HcdDateTimePickerView(datePickerMode: DatePickerDateTimeMode, defaultDateTime: Date())
        spicker?.topViewColor = kChatMainColor
        
        spicker?.clickedOkBtn = {(dateTimeStr : String?) in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-d HH:mm:ss"
            let tempDate = formatter.date(from: dateTimeStr!)
            self.withDrawaleModel?.creatTime = tempDate
            
            self.reloadTableViewData()
        }
        self.view.addSubview(spicker!)
        spicker?.showHcdDateTimePicker()
    }
    
    @IBAction func endTimeOnClick(_ sender: Any) {
        self.keyboardDissmiss()
        let spicker = HcdDateTimePickerView(datePickerMode: DatePickerDateTimeMode, defaultDateTime: Date())
        spicker?.topViewColor = kChatMainColor
        
        spicker?.clickedOkBtn = {(dateTimeStr : String?) in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-d HH:mm:ss"
            let tempDate = formatter.date(from: dateTimeStr!)
            self.withDrawaleModel?.endTime = tempDate
            
            self.reloadTableViewData()
        }
        
        self.view.addSubview(spicker!)
        spicker?.showHcdDateTimePicker()
    }
    
    
    
}
//MARK:--tableViewDataSource

extension XZWithdrawalTabVC {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.keyboardDissmiss()
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let bankListVC = XZBankListVC()
                bankListVC.bankSelect = {(image : UIImage, bankName : String) in
                    self.withDrawaleModel?.bankName = bankName
                    self.withDrawaleModel?.bankImage = image
                    self.reloadTableViewData()
                }
                bankListVC.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(bankListVC, animated: true)
            }
        }
        else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let spicker = HcdDateTimePickerView(datePickerMode: DatePickerDateTimeMode, defaultDateTime: Date())
                spicker?.topViewColor = kChatMainColor
                
                spicker?.clickedOkBtn = {(dateTimeStr : String?) in
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-d HH:mm:ss"
                    let tempDate = formatter.date(from: dateTimeStr!)
                    self.withDrawaleModel?.creatTime = tempDate
                    
                    self.reloadTableViewData()
                }
                self.view.addSubview(spicker!)
                spicker?.showHcdDateTimePicker()
            }else if indexPath.row == 1 {
                let spicker = HcdDateTimePickerView(datePickerMode: DatePickerDateTimeMode, defaultDateTime: Date())
                spicker?.topViewColor = kChatMainColor
                
                spicker?.clickedOkBtn = {(dateTimeStr : String?) in
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-d HH:mm:ss"
                    let tempDate = formatter.date(from: dateTimeStr!)
                    self.withDrawaleModel?.endTime = tempDate
                    
                    self.reloadTableViewData()
                }
                
                self.view.addSubview(spicker!)
                spicker?.showHcdDateTimePicker()
            }
        }
    }
}

extension XZWithdrawalTabVC {
    
    @objc func textFieldDidChange(textField : UITextField) {
        if textField.tag == 0 {
            self.withDrawaleModel?.tailNum = textField.text ?? ""
        }else if textField.tag == 1 {
            self.withDrawaleModel?.cardUserName = textField.text ?? ""
        }else if textField.tag == 2 {
            self.withDrawaleModel?.money = textField.text ?? ""
        }else if textField.tag == 3 {
            self.withDrawaleModel?.orderNum = textField.text ?? ""
        }
    }
    
    func getOrderNo() {
        var orderNo = (self.withDrawaleModel?.creatTime?.stringOfDate(formatter:"yyyyMMdd")) ?? ""
        orderNo = orderNo + "200040011100"
        for _ in ["1","0", "0", "0", "6", "5", "0", "3", "3", "6", "7", "7"] {
            orderNo = orderNo + String(format: "%ld", arc4random() % 10)
        }
        self.withDrawaleModel?.orderNum = orderNo
        self.reloadTableViewData()
    }
    
    func reloadTableViewData() {
        self.creatTimeBtn.setTitle(self.withDrawaleModel?.creatTime?.stringOfDate(formatter: "YYYY-MM-dd HH:mm:ss"), for: .normal)
        self.endTimeBtn.setTitle(self.withDrawaleModel?.endTime?.stringOfDate(formatter: "YYYY-MM-dd HH:mm:ss"), for: .normal)
        

        self.chooseBankBtn.setTitle(self.withDrawaleModel?.bankName, for: .normal)
        self.bankNumTF.text = self.withDrawaleModel?.tailNum
        self.cardNameTF.text = self.withDrawaleModel?.cardUserName
        self.drawalMoneyTF.text = self.withDrawaleModel?.money
        self.bankImageView.image = self.withDrawaleModel?.bankImage
        self.orderNumTF.text = self.withDrawaleModel?.orderNum
        
        self.keyboardDissmiss()
    }
    
    func keyboardDissmiss() {
        self.bankNumTF.resignFirstResponder()
        self.cardNameTF.resignFirstResponder()
        self.drawalMoneyTF.resignFirstResponder()
        self.orderNumTF.resignFirstResponder()
    }
}
