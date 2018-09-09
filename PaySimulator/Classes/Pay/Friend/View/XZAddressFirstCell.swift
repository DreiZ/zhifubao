//
//  XZAddressFirstCell.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/9.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZAddressFirstCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//MARK:--定义构造方法
//extension XZAddressFirstCell{
//    
//    class func cellWithTableView(_ tableView : UITableView) -> XZAddressFirstCell {
//        let identifier = "PayFriendCell"
//        var cell = tableView .dequeueReusableCell(withIdentifier: identifier) as? XZAddressFirstCell
//        if cell == nil {
//            cell = Bundle.main.loadNibNamed(identifier, owner: nil, options: nil)?.first as? XZAddressFirstCell
//        }
//        
//        return cell!
//        
//    }
//}
