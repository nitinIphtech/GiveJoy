//
//  ReceiversAddressViewController.swift
//  GiveJoy
//
//  Created by Lekha Mishra on 17/10/2019.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class ReceiversAddressViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
   
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var sendGiftBtn: CustomButton!
    @IBOutlet weak var cancelBtn: CustomButton!
    @IBOutlet weak var cardNumberTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.shadowView.layer.shadowColor = UIColor(hexString: "#EAEBEF").cgColor
        self.shadowView.layer.shadowColor = UIColor.blue.cgColor
        self.shadowView.layer.shadowOpacity = 1
        self.shadowView.layer.shadowOffset = CGSize.zero
        self.shadowView.layer.shadowRadius = 15
        
        self.sendGiftBtn.backgroundColor = UIColor(hexString: "#2A1562")
        self.cancelBtn.backgroundColor = UIColor(hexString: "#EAEBEF")
        
        self.sendGiftBtn.setTitleColor(UIColor.white, for: .normal)
        self.cancelBtn.setTitleColor(UIColor.lightGray, for: .normal)
        
        self.cardNumberTextField.delegate = self


    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReceiversAddressCollectionViewCell", for: indexPath) as! ReceiversAddressCollectionViewCell
        return cell
        
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
     {
        return CGSize(width: 110, height: 175)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

//        if self.cardNumberTextField.text!.count > 19{
//            return false
//        }

        if self.cardNumberTextField.text!.count < 12 {
            var hashPassword = String()
            let newChar = string.first
            let offsetToUpdate = self.cardNumberTextField.text?.index(cardNumberTextField.text!.startIndex, offsetBy: range.location)
                if string == "" {
                    cardNumberTextField.text?.remove(at: offsetToUpdate!)
                    return true
                }
                else { cardNumberTextField.text?.insert(newChar!, at: offsetToUpdate!) }
            
            for _ in 0..<cardNumberTextField.text!.count {  hashPassword += "*" }
                textField.text = hashPassword
                return false
            }
            else {
                return true
            }
        }
    
    //MARK: Send gift click.
    @IBAction func sendGiftBtnTapped(_ sender : UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GiftSendSuccessViewController") as! GiftSendSuccessViewController

        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve

        present(vc, animated: true, completion: nil)

    }
    
    @IBAction func backBtnTapped(_ sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
