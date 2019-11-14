//
//  SearchTableCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 17/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class SearchTableCell: UITableViewCell {
    @IBOutlet weak var searchFriendsImageView: UIImageView!
    @IBOutlet weak var searchriendNameLabel: UILabel!
    @IBOutlet weak var searchFriendLocationLabel: UILabel!
    @IBOutlet weak var addButton: CustomButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setFrindsList(friends:Basket){
        searchFriendsImageView.image = friends.image
       // searchriendNameLabel.text = friends.name
        searchFriendLocationLabel.text = friends.location
//        basketCountLabel.text = friends.productCount
    }

}
