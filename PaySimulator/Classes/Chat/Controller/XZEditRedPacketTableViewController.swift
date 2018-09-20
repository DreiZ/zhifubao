//
//  XZEditRedPacketTableViewController.swift
//  PaySimulator
//
//  Created by zzz on 2018/9/19.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZEditRedPacketTableViewController: UITableViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
    }
    
    
    @IBAction func receiveBtnOnClick(_ sender: Any) {
        
    }
    
    @IBAction func sendBtnOnClick(_ sender: Any) {
        
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
    
    let seeRedPacketTabVC = UIStoryboard(name: "RedPacket", bundle: nil).instantiateViewController(withIdentifier: "XZSeeRedPacketTabVC") as? XZSeeRedPacketTabVC
    self.navigationController?.pushViewController(seeRedPacketTabVC!, animated: true)
    
    
    }
    
}
