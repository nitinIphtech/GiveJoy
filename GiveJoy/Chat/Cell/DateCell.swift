//
//  DateCell.swift
//  GiveJoy
//
//  Created by SADDAM KHAN on 22/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {
    
    @IBOutlet weak var dateText:UILabel!
    
    var messageData: Message? {
        didSet {
            if let messageData = messageData {
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm a"
                formatter.amSymbol = "AM"
                formatter.pmSymbol = "PM"
//                formatter.amSymbol = "☀️"
//                formatter.pmSymbol = "🌑"
                let timeValue = formatter.string(from: date)
                self.dateText.text = "TODAY, \(timeValue)"
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
