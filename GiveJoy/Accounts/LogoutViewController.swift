//
//  LogoutViewController.swift
//  GiveJoy
//
//  Created by SADDAM KHAN on 18/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("hhh")
    }
    

    @IBAction func whiteAreaTapped(_ sender : UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func okayTapped(_ sender : UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
