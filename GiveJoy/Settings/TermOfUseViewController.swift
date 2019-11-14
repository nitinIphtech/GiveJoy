//
//  TermOfUseViewController.swift
//  GiveJoy
//
//  Created by iphtech7 on 10/15/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class TermOfUseViewController: UIViewController {
    
    @IBOutlet weak var step1Label: UILabel!
    @IBOutlet weak var step2Label: UILabel!
    @IBOutlet weak var customBtn: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true

        let myString1 = "• Step 1: You may use the Services only if you agree to form a binding contract with us and are not a person barred from receiving services under the laws of the applicable jurisdiction."
        var myMutableString1 = NSMutableAttributedString()
        myMutableString1 = NSMutableAttributedString(string: myString1, attributes: [NSAttributedString.Key.font :UIFont.systemFont(ofSize: 16.0)])
        myMutableString1.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "#7741C9"), range: NSRange(location:0,length:9))
        self.step1Label.attributedText = myMutableString1
        
        
        let myString2 = "• Step 2: Our Privacy Policy describes how we handle the information you provide to us when you use our Services."
        var myMutableString2 = NSMutableAttributedString()
        myMutableString2 = NSMutableAttributedString(string: myString2, attributes: [NSAttributedString.Key.font :UIFont.systemFont(ofSize: 16.0)])
        myMutableString2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: "#7741C9"), range: NSRange(location:0,length:9))
        self.step2Label.attributedText = myMutableString2
        
        self.customBtn.backgroundColor = UIColor(hexString: "#FFB900")
        self.customBtn.setTitleColor(UIColor(hexString: "#31156C"), for: .normal)

    }
    
@IBAction func backButtonAction(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }    

}
