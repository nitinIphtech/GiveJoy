//
//  UserProfilePostTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 15/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class UserProfilePostTableViewCell: UITableViewCell {
    @IBOutlet weak var userProfilePostImageView: UIImageView!
    @IBOutlet weak var userProfilePostNameLabel: UILabel!
    @IBOutlet weak var userprofilePostDateLabel: UILabel!
    @IBOutlet weak var userProfilePostDescriptionLabel: UILabel!
    @IBOutlet weak var userProfilrPostCommentLabel: UILabel!
    @IBOutlet weak var userProfilePostLikeLabel: UILabel!
    @IBOutlet weak var containtView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
