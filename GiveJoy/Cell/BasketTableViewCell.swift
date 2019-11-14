//
//  BasketTableViewCell.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    @IBOutlet weak var basketImageView: UIImageView!
    @IBOutlet weak var basketNameLabel: UILabel!
    @IBOutlet weak var basketPriceLabel: UILabel!
    @IBOutlet weak var basketCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUserBasket(basket:Basket){
        basketImageView.image = basket.image
        basketNameLabel.text = basket.title
        basketPriceLabel.text = basket.amount
        basketCountLabel.text = basket.productCount
    }
}
