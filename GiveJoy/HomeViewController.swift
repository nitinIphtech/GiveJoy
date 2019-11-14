//
//  PostViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 10/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class HomeViewController: VCBase,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var homePostList = [[String:String]]()
    
    var commentStatus = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         addSideMenuButton()
        tableView.estimatedRowHeight = 330
        self.tableView.rowHeight = UITableView.automaticDimension
        
        homePostList.append(["Name" : "Amit Patel","image":"LaunchScreen","Description":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.","profilePic":"user_tab"])
        commentStatus.append("0")
        homePostList.append(["Name" : "Sumit Singh","Description":"Learn ipsum dummy data","profilePic":"user_tab"])
        commentStatus.append("0")
        homePostList.append(["Name" : "Leonarod ","Description":"Learn ipsum dummy data","profilePic":"user_tab"])
        commentStatus.append("0")
        homePostList.append(["Name" : "Amit Patel","image":"LaunchScreen","Description":"Learn ipsum dummy data","profilePic":"user_tab"])
        commentStatus.append("0")
        homePostList.append(["Name" : "Ashish Patel","Description":"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s" ,"profilePic":"user_tab"])
        commentStatus.append("0")

        tableView.reloadData()

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    //MARK: TableView Delegate.

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePostList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "homeTableCell", for: indexPath) as! HomeTableViewCell
        let homePostData = self.homePostList[indexPath.row]
        cell.nameLabel.text = homePostData["Name"]
        cell.descriptionLabel.text = homePostData["Description"]
//        cell.descriptionImageView.image = UIImage(named: homePostData[ "image"] ?? "")
        cell.descriptionImageView.image = UIImage(named: "giveJoyImg")
        cell.profileImageView.layer.cornerRadius = 5
        cell.containtView.dropShadow()
        cell.postTextFieldHeightLayoutConstaint.constant = 0
        if (cell.descriptionImageView!.image == nil) {
            cell.postImageHeightLayoutConstaint.constant = 0
        }
        
        if self.commentStatus[indexPath.row] == "1" {
            cell.postTextFieldHeightLayoutConstaint.constant = 50
        }
        else {
            cell.postTextFieldHeightLayoutConstaint.constant = 0
        }
        
        
        cell.layoutIfNeeded()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    @IBAction func commentButtonTapped(_ sender: Any) {
        
        if let indexPath = Utils.shared.getIndexPathFrom(object: tableView, sender: sender as AnyObject) {
            
            self.commentStatus = self.commentStatus.map({_ in "0"})

            if self.commentStatus[indexPath.row] == "0" {
                self.commentStatus[indexPath.row] = "1"
            }
            else {
                self.commentStatus[indexPath.row] = "0"
            }
            self.tableView.reloadData()

        }

    }
    @IBAction func likeButtonTapped(_ sender: Any) {
    }

    func hideBottomView(status: Bool) {

    }
    @IBAction func sideMenuButtonTapped(_ sender: Any) {

    }
}
extension UIView {
    
    func dropShadow() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        layer.cornerRadius = 10
        self.clipsToBounds = false
    }
}
