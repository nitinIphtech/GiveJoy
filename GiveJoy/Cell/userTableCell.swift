//
//  userTableCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 15/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class userTableCell: UITableViewCell {
    @IBOutlet weak var phoneFriendsImageView: UIImageView!
    @IBOutlet weak var phoneFriendsNameLabel: UILabel!
    @IBOutlet weak var phoneFriendsScoreLabel: UILabel!
    @IBOutlet weak var phoneContactLine: UILabel!
    @IBOutlet weak var giveJoyLine: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUserDetails(user:UserDetails){
        phoneFriendsImageView.image = user.image
        phoneFriendsNameLabel.text = user.title
        
    }
    
}
