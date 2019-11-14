//
//  EditProfileViewController.swift
//  GiveJoy
//
//  Created by iphtech7 on 10/15/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit
import DropDown


class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: CustomTextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var cityTextField: CustomTextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var genderButton: UIImageView!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.fullNameTextField.setShadow()
        self.phoneTextField.setShadow()
        self.emailTextField.setShadow()
        self.cityTextField.setShadow()
        self.genderButton.tintColor = .gray
        
        self.backButton.tintColor = .purple
        self.genderButton.tintColor = .darkGray
        self.fullNameTextField.setLeftPaddingPoints(10)
        self.phoneTextField.setLeftPaddingPoints(10)
        self.emailTextField.setLeftPaddingPoints(10)
        self.cityTextField.setLeftPaddingPoints(10)
        
        self.fullNameTextField.setBackGroundColor(color: .white)
        self.cityTextField.setBackGroundColor(color: .white)
        self.phoneTextField.setBackGroundColor(color: .white)
        self.emailTextField.setBackGroundColor(color: .white)
        self.addressTextField.backgroundColor = .white
        self.addressTextField.layer.borderColor = UIColor.clear.cgColor
        
        self.fullNameTextField.setAttributedPlaceHolder(text: "Full Name", color: .gray)
         self.cityTextField.setAttributedPlaceHolder(text: "City", color: .gray)
         self.phoneTextField.setAttributedPlaceHolder(text: "Contact No.", color: .gray)
         self.emailTextField.setAttributedPlaceHolder(text: "Email", color: .gray)
        self.addressTextField.attributedPlaceholder = NSAttributedString(string: "Address",
                                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.genderTextField.attributedPlaceholder = NSAttributedString(string: "Gender",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.saveButton.layer.cornerRadius = 10
        self.cancelButton.layer.cornerRadius = 10
        
        self.genderView.layer.cornerRadius = 10
        self.genderView.layer.shadowColor = UIColor(hexString: "#EAEBEF").cgColor
        self.genderView.layer.shadowOpacity = 1
        self.genderView.layer.shadowOffset = CGSize.zero
        self.genderView.layer.shadowRadius = 8

        self.addressView.layer.cornerRadius = 10
        self.addressView.layer.shadowColor = UIColor(hexString: "#EAEBEF").cgColor
        self.addressView.layer.shadowOpacity = 1
        self.addressView.layer.shadowOffset = CGSize.zero
        self.addressView.layer.shadowRadius = 8
    }
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func genderButtonAction(_ sender: UIButton) {
        dropDown.anchorView = sender
        dropDown.dataSource = ["Male","Female"]
        dropDown.show()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            DispatchQueue.main.async {
                self.genderTextField.text = item
            }
        }
    }
    
}
