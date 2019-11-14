//
//  CreatePostFriendTableViewController.swift
//  GiveJoy
//
//  Created by Abhishek ranjan Dubey on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//


    import UIKit

    class CreatePostFriendTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

        @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var postBtn: CustomButton!
        @IBOutlet weak var cancelBtn: CustomButton!

        
        
        
         var nameList = ["Burns Marks","Grant Marshall"," Julia Petersen","Duran Clayton","Aurelien Salomon","Marie Winter","Burns Marks","Grant Marshall","Julia Petersen","Duran Clayton"]
        
         var friendsDetailInfoArray: [String] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.navigationBar.isHidden = true

           // self.tableView.backgroundColor = UIColor(hexString: ACTIVE_COLOR)

            self.tableView.allowsMultipleSelection = true
            self.tableView.allowsMultipleSelectionDuringEditing = true
            
            
            self.postBtn.backgroundColor = UIColor(hexString: "#FFB900")
            self.postBtn.setTitleColor(UIColor(hexString: "#31156C"), for: .normal)
            self.cancelBtn.backgroundColor = UIColor(hexString: "#543A83")
            self.cancelBtn.setTitleColor(UIColor(hexString: "#78849E"), for: .normal)


            
        }
        //MARK: TableView Delegate.

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return nameList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "GiveJoyFriendsTableViewCell", for: indexPath) as! GiveJoyFriendsTableViewCell
            
            if cell.isSelected
            {
                cell.backgroundColor = UIColor.systemBlue
            }
            else
            {
                cell.backgroundColor = UIColor.clear
            }
            cell.giveJoyNameLabel.text = nameList[indexPath.row]
            cell.giveJoyImageView.layer.cornerRadius = 20
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        guard let cell = tableView.cellForRow(at: indexPath) as? GiveJoyFriendsTableViewCell else { return }

        if cell.isSelected{
          friendsDetailInfoArray.append(nameList[indexPath.row])
            print(friendsDetailInfoArray)
             cell.backgroundColor = UIColor(hexString: "#665EFF")
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        // also do your UI changing for the cell here for deselecting
        let cell = tableView.cellForRow(at: indexPath)
        if let index = friendsDetailInfoArray.firstIndex(of: nameList[indexPath.row]) {
            friendsDetailInfoArray.remove(at: index)
            cell!.backgroundColor = UIColor.clear
        }

//        print(friendsDetailInfoArray)
    }
        
        @IBAction func backButtonTapped(_ sender: Any) {
            navigationController?.popViewController(animated: true)
        }
        
}
