 //
 //  ManageCardsViewController.swift
 //  GiveJoy
 //
 //  Created by iphtech7 on 10/15/19.
 //  Copyright © 2019 Nitin Sharma. All rights reserved.
 //
 
  import UIKit
  import DropDown
  
  
  class ManageCardsViewController: UIViewController, UITextFieldDelegate {
     
     @IBOutlet weak var cardNumberTextField: UITextField!
     @IBOutlet weak var expiresTextField: UITextField!
     @IBOutlet weak var nameTextField: UITextField!
     @IBOutlet weak var cvcTextField: UITextField!
     @IBOutlet weak var cardTypeView: UIView!
     @IBOutlet weak var cityView: UIView!
 //    @IBOutlet weak var addressView: UIView!
     @IBOutlet weak var cardTypeTextfield: UITextField!
     @IBOutlet weak var addressTxtField: UITextField!
     @IBOutlet weak var cityTextField: UITextField!
     @IBOutlet weak var manageCardsView: UIView!
     @IBOutlet weak var cardNumberView: UIView!
     @IBOutlet weak var expiresView: UIView!
     @IBOutlet weak var nameView: UIView!
     @IBOutlet weak var cvcView: UIView!
     @IBOutlet weak var addressView: UIView!
     @IBOutlet weak var cardTypeImageView: UIImageView!
     @IBOutlet weak var cityImageView: UIImageView!
     @IBOutlet weak var cancelButton: UIButton!
     @IBOutlet weak var saveButton: UIButton!
     @IBOutlet weak var addCard: UIButton!
     
     let dropDown = DropDown()
     
     
     override func viewDidLoad() {
         super.viewDidLoad()
        // Do any additional setup after loading the view.

        //        self.cardTypeTextfield.backgroundColor = .white
 //        self.cityTextField.backgroundColor = .white
         self.cardTypeImageView.tintColor = .gray
         self.cityImageView.tintColor = .gray
         self.addressTxtField.backgroundColor = .white
         self.navigationController?.navigationBar.isHidden = true

         self.saveButton.layer.cornerRadius = 10
         self.cancelButton.layer.cornerRadius = 10
         self.addCard.layer.cornerRadius = 10

         self.addressTxtField.layer.borderColor = UIColor.clear.cgColor

         self.cardNumberView.layer.cornerRadius = 10
         self.expiresView.layer.cornerRadius = 10
         self.cvcView.layer.cornerRadius = 10
         self.nameView.layer.cornerRadius = 10
        
        self.cardNumberView.layer.borderColor = UIColor(red: 120, green: 132, blue: 158, alpha: 1).cgColor
        
         self.cardNumberTextField.attributedPlaceholder = NSAttributedString(string: "0123 4567 8910 1112",
                         attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.nameTextField.attributedPlaceholder = NSAttributedString(string: "JHON DOE",
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
          self.expiresTextField.attributedPlaceholder = NSAttributedString(string: "MM/YY",
                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
         self.cvcTextField.attributedPlaceholder = NSAttributedString(string: "000",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
         self.cityTextField.attributedPlaceholder = NSAttributedString(string: "City",
         attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        self.cardTypeTextfield.attributedPlaceholder = NSAttributedString(string: "Card Type",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
         self.addressTxtField.attributedPlaceholder = NSAttributedString(string: "Address",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])

        self.setShadowAndCornerRadius(manageCardsView, shadowRadius: 16)
        self.setShadowAndCornerRadius(cardTypeView)
        self.setShadowAndCornerRadius(cityView)
        self.setShadowAndCornerRadius(addressView)

         self.cardNumberTextField.delegate = self
         self.expiresTextField.delegate = self
         self.nameTextField.delegate = self
         self.cvcTextField.delegate = self
     }
    
    func setShadowAndCornerRadius(_ view: UIView, shadowRadius: CGFloat = 8.0) {
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(hexString: "#EAEBEF").cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = shadowRadius
        view.clipsToBounds = false
    }
     
     @IBAction func cardTypeButtonAction(_ sender: UIButton) {
         dropDown.anchorView = sender
         dropDown.dataSource = ["Visa","Master Card","Rupay"]
         dropDown.show()
         dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
             print("Selected item: \(item) at index: \(index)")
             DispatchQueue.main.async {
                 self.cardTypeTextfield.text = item
             }
         }
     }
     
     @IBAction func cityButtonAction(_ sender: UIButton) {
         dropDown.anchorView = sender
         dropDown.dataSource = ["Lucknow","Delhi","Kanpur","Varanasi","Allahabad","Lucknow","Delhi","Kanpur","Varanasi","Allahabad","Lucknow","Delhi","Kanpur","Varanasi","Allahabad","Lucknow","Delhi","Kanpur","Varanasi","Allahabad", "Lucknow","Delhi","Kanpur","Varanasi","Allahabad"]
         dropDown.show()
         dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
             print("Selected item: \(item) at index: \(index)")
             DispatchQueue.main.async {
                 self.cityTextField.text = item
             }
         }
     }
     
     @IBAction func backButtonAction(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
     }
     
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         guard let currentText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) else { return true }
         
         if textField == cardNumberTextField {
             textField.text = currentText.grouping(every: 4, with: " ")
             return false
         }
         else { // Expiry Date Text Field
             textField.text = currentText.grouping(every: 2, with: "/")
             return false
         }
     }
  }
