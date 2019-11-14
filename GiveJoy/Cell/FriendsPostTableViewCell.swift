//
//  FriendsPostTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 15/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class FriendsPostTableViewCell: UITableViewCell {
    @IBOutlet weak var profileFriendImageView: UIImageView!
    @IBOutlet weak var friendsProfileNameLabel: UILabel!
    @IBOutlet weak var friendProfileDateLabel: UILabel!
    @IBOutlet weak var friendProfileDescriptionLabel: UILabel!
    @IBOutlet weak var friendProfileShareButton: UIButton!
    @IBOutlet weak var profileFriendsNumberOfCommentLabel: UILabel!
    @IBOutlet weak var friendProfileLikesLabel: UILabel!
    @IBOutlet weak var profilePostView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
