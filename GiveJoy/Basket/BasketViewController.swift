//
//  BasketViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var userBasket: [Basket] = []
    @IBOutlet weak var choosedFriendButton: CustomButton!
    @IBOutlet weak var addCardButton: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userBasket = Basket.createUserBasketArray()
        choosedFriendButton.backgroundColor = UIColor(hexString: INACTIVE_COLOR)
        addCardButton.backgroundColor = UIColor(hexString: ADD_CARD_COLLOR_BUTTON)
        self.navigationController?.navigationBar.isHidden = true


    }
    //MARK: TableView Delegate.

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userBasket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
        let basketData = self.userBasket[indexPath.row]
        cell.setUserBasket(basket: basketData)
        cell.basketImageView.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110 //UITableView.automaticDimension
    }
    @IBAction func increaseButtonTapped(_ sender: Any) {
    }
    @IBAction func decreaseButtonTapped(_ sender: Any) {
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func chooseFriendButtonTapped(_ sender: Any) {
    }
    @IBAction func addCardButtonTapped(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "AddFriendsViewController") as! AddFriendsViewController
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    
}
