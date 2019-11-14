//
//  PaymentViewController.swift
//  GiveJoy
//
//  Created by SADDAM KHAN on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    
    @IBOutlet weak var cardTypeTextField: CustomTextField!
    @IBOutlet weak var cityTextField: CustomTextField!
    @IBOutlet weak var addressTypeTextField: CustomTextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.cardTypeTextField.setLeftPaddingPoints(10)
        self.cityTextField.setLeftPaddingPoints(10)
        self.addressTypeTextField.setLeftPaddingPoints(10)

        self.navigationController?.navigationBar.isHidden = true
        
    }
    

    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    
    }
    
}
