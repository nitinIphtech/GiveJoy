//
//  PopularGiftCardTableCell.swift
//  GiveJoy
//
//  Created by SADDAM KHAN on 23/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class PopularGiftCardTableCell: UITableViewCell {
    
    @IBOutlet weak var soldLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.soldLabel.layer.cornerRadius = 10.0
        self.soldLabel.layer.borderColor = UIColor.white.cgColor
        self.soldLabel.layer.borderWidth = 0.5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
