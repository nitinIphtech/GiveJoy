//
//  FriendsProfileViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 15/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class FriendsProfileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let descriptionList = ["When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us.","When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us."]
    
    var users : UserDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        self.tableView.estimatedRowHeight = 204
    }
    
    //MARK: TableView Delegate.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsPostTableViewCell") as! FriendsPostTableViewCell
        cell.profilePostView.dropShadow()
        cell.friendProfileDescriptionLabel.text! = descriptionList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 256
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension UILabel {
    func setDifferentColor(string: String, location: Int, length: Int){
        
        let attText = NSMutableAttributedString(string: string)
        attText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: LABEL_TEXT_COLOR), range: NSRange(location:5,length:4))
        attributedText = attText
        
    }
}
