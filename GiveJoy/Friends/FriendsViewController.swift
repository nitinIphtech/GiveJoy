//
//  FriendsViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 11/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var phoneFriendsView: UIView!
    @IBOutlet weak var giveJoyFriends: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var phoneContactButton: UIButton!
    @IBOutlet weak var giveJoyFriendsButton: UIButton!
    var contentSize  = 0.0
    var contentOffset = CGPoint.zero

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

    self.scrollView.delegate = self
        self.setPhoneContactsViewController()
        self.setGiveJoyFriendsViewController()
        self.setActiveTab(activeButton: phoneContactButton)
        
    }
    @IBAction func phoneContactButtonTapped(_ sender: UIButton) {
        self.setScrolling(multiplier: 0)
        if phoneContactButton.isSelected {
            phoneContactButton.tintColor = UIColor.red
        }
        setActiveTab(activeButton: phoneContactButton)
    }
    @IBAction func giveKoyButtonTapped(_ sender: Any) {
        self.setScrolling(multiplier: 1)
        if giveJoyFriendsButton.isSelected {
            giveJoyFriendsButton.tintColor = UIColor.red
        }
        setActiveTab(activeButton: giveJoyFriendsButton)

    }
    func setScrolling(multiplier: CGFloat) {
        let  x = self.view.frame.size.width*multiplier
        let y: CGFloat = 0
        let offset = CGPoint(x: x, y: y)
        self.scrollView.setContentOffset(offset, animated: true)
    }
    func setPhoneContactsViewController(){
        let controller: PhoneFriendsViewController = self.storyboard!.instantiateViewController(withIdentifier: "PhoneFriendsViewController") as! PhoneFriendsViewController
        controller.view.frame = self.phoneFriendsView.bounds
        controller.willMove(toParent: self)
        self.phoneFriendsView.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    func setGiveJoyFriendsViewController(){
        let controller: GiveJoyFriendsViewController = self.storyboard!.instantiateViewController(withIdentifier: "GiveJoyFriendsViewController") as! GiveJoyFriendsViewController
        controller.view.frame = self.giveJoyFriends.bounds
        controller.willMove(toParent: self)
        self.giveJoyFriends.addSubview(controller.view)
        self.addChild(controller)
        controller.didMove(toParent: self)
    }
    func setActiveTab(activeButton:UIButton) {
        phoneContactButton.setTitleColor(.white, for: .normal)
        giveJoyFriendsButton.setTitleColor(.white, for: .normal)
        activeButton.setTitleColor(UIColor(hexString: YELLOW_BG), for: .normal)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
