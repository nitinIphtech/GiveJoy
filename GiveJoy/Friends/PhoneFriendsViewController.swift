//
//  PhoneFriendsViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 14/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class PhoneFriendsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
        var objects  = [CNContact]()
        let cellIdentifier = "userTableCell"
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.navigationBar.isHidden = true

            self.tableView.estimatedRowHeight = 120
            self.getContacts()
            self.tableView.allowsMultipleSelection = true
            self.tableView.allowsMultipleSelectionDuringEditing = true
            
            self.tableView.register(UINib(nibName: self.cellIdentifier, bundle: nil), forCellReuseIdentifier: self.cellIdentifier)

           self.tableView.reloadData()
        }
        func getContacts() {
            let store = CNContactStore()
            
            switch CNContactStore.authorizationStatus(for: .contacts){
            case .authorized:
                self.retrieveContactsWithStore(store: store)
                
            // This is the method we will create
            case .notDetermined:
                store.requestAccess(for: .contacts){succeeded, err in
                    guard err == nil && succeeded else{
                        return
                    }
                    self.retrieveContactsWithStore(store: store)
                    
                }
            default:
                print("Not handled")
            }
            
        }
        func retrieveContactsWithStore(store: CNContactStore)
        {
            let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey,CNContactImageDataKey, CNContactEmailAddressesKey] as [Any]
            let request = CNContactFetchRequest(keysToFetch: keysToFetch as! [CNKeyDescriptor])
            var cnContacts = [CNContact]()
            do {
                try store.enumerateContacts(with: request){
                    (contact, cursor) -> Void in
                    if (!contact.phoneNumbers.isEmpty) {
                    }
                    
                    if contact.isKeyAvailable(CNContactImageDataKey) {
                        if let contactImageData = contact.imageData {
                            print(UIImage(data: contactImageData)!) // Print the image set on the contact
                        }
                    } else {
                        // No Image available
                        
                    }
                    if (!contact.emailAddresses.isEmpty) {
                    }
                    cnContacts.append(contact)
                    self.objects = cnContacts
                }
            } catch let error {
                NSLog("Fetch contact error: \(error)")
            }
            
            NSLog(">>>> Contact list:")
            for contact in cnContacts {
                let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
                NSLog("\(fullName): \(contact.phoneNumbers.description)")
            }
           // self.tableView.reloadData()
        }
    //MARK: TableView Delegate.

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return objects.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! userTableCell
            cell.phoneFriendsImageView.layer.cornerRadius = 15
//            cell.phoneFriendsScoreLabel.isHidden = true
            let contact = self.objects[indexPath.row]
            print("theis my contact arrau \(self.objects.count)")
            let formatter = CNContactFormatter()
            cell.phoneFriendsNameLabel.text = formatter.string(from: contact )
            if let actualNumber = contact.phoneNumbers.first?.value {
                print(actualNumber.stringValue)
    //            cell.PersonMobileNOLabel.text = actualNumber.stringValue
            }
            else {
    //            cell.PersonMobileNOLabel.text = "N.A "
            }
    //        if let actualEmail = (contact as AnyObject).emailAddresses?.first?.value as String? {
    //            print(actualEmail)
    //            cell.PersonEmailLabel.text = actualEmail
    //        }
    //        else{
    ////            cell.PersonEmailLabel.text = "N.A "
    //        }
//            if let imageData = contact.imageData {
//                //If so create the image
//    //            let userImage = UIImage(data: imageData)
//    //            cell.phoneFriendsImageView.image = userImage;
//            }
//
//            else{
//                cell.phoneFriendsImageView.image = UIImage (named: "N.A")
//            }
            cell.phoneFriendsImageView.image = UIImage (named: "ProfileImage")
            cell.phoneContactLine.isHidden = false
            return cell
        }
       //}

    //        return cell

    //    }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let destination = self.storyboard?.instantiateViewController(withIdentifier: "FriendsViewController") as! FriendsViewController
    //        self.navigationController?.pushViewController(destination, animated: true)
        }
    }
