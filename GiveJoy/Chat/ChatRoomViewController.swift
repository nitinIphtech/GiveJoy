//
//  ChatRoomViewController.swift
//  GiveJoy
//
//  Created by SADDAM KHAN on 21/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class ChatRoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var sendBtn:UIButton!
    @IBOutlet weak var chatView:UIView!

    var userNameValue = ""
    var messageArray = Message.allMessageData()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.userName.text = userNameValue
        
        self.messageTableView.estimatedRowHeight = 120
        
        self.messageText.delegate = self
        self.messageText.text = "Say something ..."
        self.messageText.textColor = UIColor.lightGray
        
        self.navigationController?.navigationBar.isHidden = true


    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        var indexPath = IndexPath(row: self.messageArray.count - 1, section: 0)
        var bottom = UITableView.ScrollPosition.bottom
        self.messageTableView.scrollToRow(at: indexPath, at: bottom, animated: true)
        
//                let lastSectionIndex = self.messageTableView!.numberOfSections - 1
//        // Then grab the number of rows in the last section
//        let lastRowIndex = self.messageTableView.numberOfRows(inSection: lastSectionIndex)
//        // Now just construct the index path
//        let pathToLastRow = IndexPath(row: lastRowIndex, section: lastSectionIndex)
//        // Make the last row visible
//        self.messageTableView.scrollToRow(at: pathToLastRow, at: UITableView.ScrollPosition.none, animated: true)
//

        self.chatView.layer.cornerRadius = 8.0
        self.chatView.layer.shadowColor = UIColor.lightGray.cgColor
        self.chatView.layer.shadowOpacity = 1
        self.chatView.layer.shadowOffset = CGSize.zero
        self.chatView.layer.shadowRadius = 8

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if messageArray[indexPath.row].sender == SenderType.reciever.rawValue {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecieverMessageCell", for: indexPath) as! RecieverMessageCell
            cell.messageData = self.messageArray[indexPath.row]
            return cell
        }
        if messageArray[indexPath.row].sender == SenderType.dateValue.rawValue {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateCell
            cell.messageData = self.messageArray[indexPath.row]
            return cell
        }

        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderMessageCell", for: indexPath) as! SenderMessageCell
            cell.messageData = self.messageArray[indexPath.row]
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if messageArray[indexPath.row].sender == SenderType.dateValue.rawValue {
            return 21.0
        }
        else {
            return UITableView.automaticDimension
        }
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //MARK: Search Click.
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
    }
    
    //MARK: UITextViewDelegate
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
                
            }
        }
        
        var search = ""
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            
            if text.isEmpty {
    //            search = String(search.characters.dropLast())
                search = String(search.dropLast())
            }
            else {
                search = self.messageText.text!+text
            }
            
//            if search == "" {
//                self.sendBtn.isHidden = true
//            }
//            else {
//                self.sendBtn.isHidden = false
//            }
            return true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            
            if self.messageText.text! == "" {
                textView.text = "Say something ..."
                textView.textColor = UIColor.lightGray
            }

    }
    
    @IBAction func sendClick(_ sender: UIButton) {

        if self.messageText.textColor == UIColor.black && self.messageText.text != "" {

            self.messageArray.append((Message(sender: SenderType.sender.rawValue, messageBody: self.messageText.text)))
            
            self.messageTableView.reloadData()
            
            let indexPath = IndexPath(row: self.messageArray.count - 1, section: 0)
            self.messageTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)

            self.messageText.resignFirstResponder()
            self.messageText.text = "Say something ..."
            self.messageText.textColor = UIColor.lightGray

        }

    }

}
