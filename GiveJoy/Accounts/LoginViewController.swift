//
//  LoginVC.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 08/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var continueButton: CustomButton!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var shadowView: UIView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        self.shadowView.layer.shadowOpacity = 1
        self.shadowView.layer.shadowOffset = CGSize.zero
        self.shadowView.layer.shadowRadius = 15

        self.textFieldSetup(emailTextField, placeHolderString: "Email")
        self.textFieldSetup(passwordTextField, placeHolderString: "Password")

        continueButton.layer.cornerRadius = 10.0
        continueButton.setTitleColor(UIColor(hexString: "#31156C"), for: .normal)
        continueButton.backgroundColor = UIColor(hexString: "#FFB900")
    }

    func textFieldSetup(_ textField : CustomTextField, placeHolderString: String) {
        textField.setShadow()
        Utils.shared.setLeftPaddingPoints(textFeild: textField, 20)
        textField.setBackGroundColor(color: .white)
        textField.setAttributedPlaceHolder(text: placeHolderString, color: UIColor(red: 120.0/255, green: 132.0/255, blue: 158.0/255, alpha: 0.558))
    }

    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
          self.view.endEditing(true)
      }
    @IBAction func forgotButtonTapped(_ sender: Any) {
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
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(destination, animated: true)
    }
    

}
