//
//  GiveJoyFriendsViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 14/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class GiveJoyFriendsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
         let cellIdentifier = "userTableCell"
         var userName : [UserDetails] = []
         
         override func viewDidLoad() {
             super.viewDidLoad()
            self.navigationController?.navigationBar.isHidden = true

             self.tableView.reloadData()
             self.tableView.allowsMultipleSelection = true
             self.tableView.allowsMultipleSelectionDuringEditing = true
             self.tableView.register(UINib(nibName: self.cellIdentifier, bundle: nil), forCellReuseIdentifier: self.cellIdentifier)
            userName = UserDetails.createUserDetailsArray()

         }
         //MARK: TableView Delegate.

         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
             return userName.count
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! userTableCell
             let userData = userName[indexPath.row]
             cell.setUserDetails(user: userData)
             cell.phoneFriendsImageView.layer.cornerRadius = 10
            cell.phoneFriendsScoreLabel.isHidden = true
            cell.giveJoyLine.isHidden = false
             return cell
         }
         
         func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
             
             return 120
         }
         
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let user = userName[indexPath.row]
               let destination = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "FriendsProfileViewController") as! FriendsProfileViewController
               destination.users = user
             self.navigationController?.pushViewController(destination, animated: true)
         }
     }
