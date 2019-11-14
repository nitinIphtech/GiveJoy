//
//  GiveJoyFriendsTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 14/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class GiveJoyFriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var giveJoyImageView: UIImageView!
    @IBOutlet weak var giveJoyNameLabel: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }


        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
           // self.accessoryType = selected ? .checkmark : .none

    }
    }
