//
//  XZPayUserInfoCell.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/2.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZPayUserInfoCell: UITableViewCell {

    //MARK:--xib 属性
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //统一设置控件的一些基本属性
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        detailLabel.font = UIFont.systemFont(ofSize: 16)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
