//
//  NotificationViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 17/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 
    @IBOutlet weak var tableView: UITableView!
    
    var cellIdentifier = "NotificationTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }
    //MARK: TableView Delegate.

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NotificationTableViewCell
        cell.notificationImageView.layer.cornerRadius = 5
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
