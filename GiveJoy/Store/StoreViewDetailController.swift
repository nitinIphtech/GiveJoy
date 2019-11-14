//
//  StoreViewController.swift
//  GiveJoy
//
//  Created by Abhishek ranjan Dubey on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class StoreViewDetailController: UIViewController {
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var soldLabel: UILabel!
    @IBOutlet weak var sendBtn: CustomButton!
    @IBOutlet weak var companyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        Utils.shared.setLeftPaddingPoints(textFeild: searchField, 55.0)
        self.searchField.layer.cornerRadius = 21.0
        
        self.shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        self.shadowView.layer.shadowOpacity = 1
        self.shadowView.layer.shadowOffset = CGSize.zero
        self.shadowView.layer.shadowRadius = 15
        
        self.soldLabel.layer.cornerRadius = 9.0
        self.soldLabel.layer.borderColor = UIColor.white.cgColor
        self.soldLabel.layer.borderWidth = 0.5
        
        self.sendBtn.setTitleColor(UIColor(hexString: "#31156C"), for: .normal)
        
        self.companyLabel.layer.cornerRadius = 13.0
        self.companyLabel.layer.borderColor = UIColor(hexString: "#78849E").cgColor
        self.companyLabel.layer.borderWidth = 1.0

    }

    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
