//
//  SettingsViewController.swift
//  GiveJoy
//
//  Created by iphtech7 on 10/15/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//


import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
  
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var manageCardsButton: UIButton!
    @IBOutlet weak var getHelpButton: UIButton!
    @IBOutlet weak var termsOfUseButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImage.layer.cornerRadius = 10
       
        filterButton.tintColor = .white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
   
    @IBAction func backButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func filterButtonAction(_ sender: Any) {
    }
    
    @IBAction func editProfileButtonAction(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func manageCardsButtonAction(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "ManageCardsViewController") as! ManageCardsViewController
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func getHelpButtonAction(_ sender: Any) {
        
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "IntroViewController") as! IntroViewController
        destination.isFromSetting = true
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func termsOfUseButtonAction(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "TermOfUseViewController") as! TermOfUseViewController
        self.navigationController?.pushViewController(destination, animated: true)
    }
    @IBAction func logOutButtonACtion(_ sender: Any) {

        let destination = self.storyboard?.instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController
        present(destination, animated: true, completion: nil)
    }
   
}
