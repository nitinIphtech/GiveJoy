//
//  HomeTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 10/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentsTextField: UITextField!
    @IBOutlet weak var containtView: UIView!
    @IBOutlet weak var descriptionImageView: UIImageView!
    @IBOutlet weak var postImageHeightLayoutConstaint: NSLayoutConstraint!
    @IBOutlet weak var postTextFieldHeightLayoutConstaint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
