//
//  RecieverMessageCell.swift
//  GiveJoy
//
//  Created by SADDAM KHAN on 21/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//
import UIKit

class RecieverMessageCell: UITableViewCell {
    
    @IBOutlet weak var messageText:PaddingLabel!
    @IBOutlet weak var profileImage:UIImageView!
    @IBOutlet weak var showMessageText:UILabel!

    var messageData: Message? {
        didSet {
            if let messageData = messageData {
                self.messageText.text = messageData.messageBody
                self.showMessageText.text = messageData.messageBody
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.profileImage.layer.cornerRadius = 12.5
        self.profileImage.layer.borderWidth = 5
        self.profileImage.layer.borderColor = UIColor.white.cgColor
        
        self.messageText.layer.cornerRadius = 15
        self.messageText.clipsToBounds = true

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
