//
//  XZPayFriendCellTableViewCell.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/9.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayFriendCellTableViewCell: UITableViewCell {

    //MARK:--cell 属性
    
    @IBOutlet weak var iconImg: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var noReadView: UIView!
    @IBOutlet weak var noDisturbImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImg.layer.masksToBounds = true
        iconImg.layer.cornerRadius = 4.5
        
        noReadView.layer.masksToBounds = true
        noReadView.layer.cornerRadius = 4.5
    }

  
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//MARK:--定义构造方法
extension XZPayFriendCellTableViewCell{
    
    class func cellWithTableView(_ tableView : UITableView) -> XZPayFriendCellTableViewCell {
        let identifier = "PayFriendCell"
        var cell = tableView .dequeueReusableCell(withIdentifier: identifier) as? XZPayFriendCellTableViewCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed(identifier, owner: nil, options: nil)?.first as? XZPayFriendCellTableViewCell
        }
        
        return cell!
        
    }
}

