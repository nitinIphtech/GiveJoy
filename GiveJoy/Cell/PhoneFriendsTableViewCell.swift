//
//  PhoneFriendsTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 14/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit


class PhoneFriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var phoneFriendsImageView: UIImageView!
    @IBOutlet weak var phoneFriendsNameLabel: UILabel!
    @IBOutlet weak var phoneFriendsScoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       // self.accessoryType = selected ? .checkmark : .none
    }

}
