//
//  SideMenuTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 11/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var sideMenuImageView: UIImageView!
    @IBOutlet weak var sideMenuTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
