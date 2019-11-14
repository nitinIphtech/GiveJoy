//
//  AddFriendsViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class AddFriendsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancelButton: CustomButton!
    @IBOutlet weak var confirmButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

    confirmButton.backgroundColor = UIColor(hexString: ACTIVE_COLOR)
        cancelButton.backgroundColor = UIColor(hexString: CANCEL_BUTTON_COLOR)
        cancelButton.tintColor = UIColor.gray
    }
    //MARK: TableView Delegate.

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AddFriendsTableCell", for: indexPath) as! AddFriendsTableCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    @IBAction func chooseButtonTapped(_ sender: Any) {
    }
    @IBAction func confirmButtonTapped(_ sender: Any) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
             self.navigationController?.pushViewController(destination, animated: true)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
}
