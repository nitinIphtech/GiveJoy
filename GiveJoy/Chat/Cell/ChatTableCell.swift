//
//  MessagesTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 18/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class ChatTableCell: UITableViewCell {
    
    
    @IBOutlet weak var userImageView:UIImageView!
    @IBOutlet weak var userNameLbl:UILabel!
    @IBOutlet weak var userDescLbl:UILabel!
    @IBOutlet weak var statusLbl:UILabel!
    
    var chatData: ChatList? {
        didSet {
            if let chatData = chatData {
                
                self.userNameLbl.text = chatData.userName
                self.userDescLbl.text = chatData.userDesc
                self.userImageView.image = UIImage(named: chatData.userPic)
                if chatData.onlineStatus == "0" {
                    self.statusLbl.isHidden = true
                    
                }
                else {
                    self.statusLbl.isHidden = false
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
