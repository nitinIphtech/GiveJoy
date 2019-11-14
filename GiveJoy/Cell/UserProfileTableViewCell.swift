//
//  UserProfileTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 15/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class UserProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var userProfileImageLabel: UIImageView!
    @IBOutlet weak var userProfielNameLabel: UILabel!
    @IBOutlet weak var userProffileIndoxButton: CustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
