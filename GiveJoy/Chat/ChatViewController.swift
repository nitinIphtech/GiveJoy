//
//  MessagesViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 18/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var chatTableView: UITableView!
    
    var chatListData = ChatList.allChatListData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatListData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableCell", for: indexPath) as! ChatTableCell
        cell.chatData = self.chatListData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatRoomViewController") as! ChatRoomViewController
        vc.userNameValue = self.chatListData[indexPath.row].userFirstName
        self.navigationController?.pushViewController(vc, animated: true)

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }

    //MARK: Add New User Click.
    @IBAction func newUserTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }

    //MARK: Search Click.
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }


}
