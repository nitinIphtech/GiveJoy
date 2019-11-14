//
//  AddFriendsTableCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class AddFriendsTableCell: UITableViewCell {
    @IBOutlet weak var addFriendsImageView: UIImageView!
    @IBOutlet weak var addFriendNameLabel: UILabel!
    @IBOutlet weak var addFriendLocationLabel: UILabel!
    @IBOutlet weak var chooseButton: CustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.chooseButton.backgroundColor = UIColor(hexString: "#F3B342")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
