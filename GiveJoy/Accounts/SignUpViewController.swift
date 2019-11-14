//
//  SignUpVC.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 08/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    


    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var continueButton: CustomButton!

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var circleLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textFieldSetup(nameTextField, placeHolderString: "Name")
        self.textFieldSetup(emailTextField, placeHolderString: "Email")
        self.textFieldSetup(phoneTextField, placeHolderString: "Phone No")
        self.textFieldSetup(passwordTextField, placeHolderString: "Password")

        continueButton.layer.cornerRadius = 10.0
        continueButton.setTitleColor(UIColor(hexString: "#31156C"), for: .normal)
        continueButton.backgroundColor = UIColor(hexString: "#FFB900")

//        self.signUpButton.layer.cornerRadius = 12

    }
    
    
    func textFieldSetup(_ textField : CustomTextField, placeHolderString: String) {
        textField.setShadow()
        Utils.shared.setLeftPaddingPoints(textFeild: textField, 20)
        textField.setBackGroundColor(color: .white)
        textField.setAttributedPlaceHolder(text: placeHolderString, color: UIColor(red: 120.0/255, green: 132.0/255, blue: 158.0/255, alpha: 0.558))
    }

    
    override func viewDidLayoutSubviews() {
        self.circleLabel.layer.cornerRadius = self.circleLabel.frame.height/2.0
        self.circleLabel.clipsToBounds = true
    }

    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
          self.view.endEditing(true)
    }

    @IBAction func continueButtonTapped(_ sender: Any) {
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MainUINavigationView")
        window.rootViewController = vc
        let options: UIView.AnimationOptions = .transitionCurlDown //.transitionCrossDissolve
        let duration: TimeInterval = 0.5
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
        { completed in
            
        })

    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
