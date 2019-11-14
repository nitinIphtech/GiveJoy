//
//  UserProfileViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 15/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let descriptionList = ["When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us."]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

     self.tableView.estimatedRowHeight = 163
    }
    //MARK: TableView Delegate.

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section ==  0{
            return 0
        }
        else{
            return descriptionList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "UserProfileTableViewCell", for: indexPath) as! UserProfileTableViewCell
        return cell
        }
        else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "UserProfilePostTableViewCell", for: indexPath) as! UserProfilePostTableViewCell
            cell.userProfilePostDescriptionLabel.text! = descriptionList[indexPath.row]
            cell.userProfilePostImageView.layer.cornerRadius = 5
            cell.containtView.layer.cornerRadius = 10
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 370
        }
        return UITableView.automaticDimension
    }
    @IBAction func BackButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    

}
