//
//  GiftListTableViewCell.swift
//  GiveJoy
//
//  Created by Lekha Mishra on 17/10/2019.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class GiftListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
