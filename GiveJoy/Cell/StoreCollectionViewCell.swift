//
//  StoreCollectionViewCell.swift
//  GiveJoy
//
//  Created by Abhishek ranjan Dubey on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var itemView:UIView!
    @IBOutlet weak var itemImage:UIImageView!
    @IBOutlet weak var itemName:UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()

//        self.itemView.layer.shadowColor = UIColor.lightGray.cgColor
//        self.itemView.layer.shadowOpacity = 1
//        self.itemView.layer.shadowOffset = CGSize.zero
//        self.itemView.layer.shadowRadius = 5

    }

}
