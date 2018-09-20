//
//  XZSeeRedPacketCell.swift
//  PaySimulator
//
//  Created by 再出发 on 2018/9/20.
//  Copyright © 2018年 再出发. All rights reserved.
//

import UIKit

class XZSeeRedPacketCell: UITableViewCell {

    @IBOutlet weak var iconImg: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var moneylabel: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
