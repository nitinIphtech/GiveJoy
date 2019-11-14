//
//  GiftListViewController.swift
//  GiveJoy
//
//  Created by Lekha Mishra on 17/10/2019.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class GiftListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendGiftsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sendGiftsButton.layer.cornerRadius = 15

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 115
         
     }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GiftListTableViewCell", for: indexPath) as! GiftListTableViewCell
        cell.stockLabel.layer.cornerRadius = 10
        cell.stockLabel.clipsToBounds = true
        return cell
    }

    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
  
    @IBAction func sendsGiftsButtonAction(_ sender: Any) {
        
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "ReceiversAddressViewController") as! ReceiversAddressViewController
             self.navigationController?.pushViewController(destination, animated: true)

        
    }

}
