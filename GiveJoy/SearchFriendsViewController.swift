//
//  SearchFriendsViewController.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class SearchFriendsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataFound: UILabel!
    @IBOutlet weak var searchField: UITextField!
    
    var serachFriends:[Basket] = []
    var searchedName = [String]()
    let nameArr = ["Pedro Araez","Frank Kristopoulos","Sylvester Balchunas","Johannes Lenferink","Arezio Aurechio","Fidel Martin","Jules Boutin","Attilio Marzi","Oasge Christiansen",    "Gurt Mistrioty","Kusti Franti","Michael Myatowych","Odilian Gosselin","Francisco Pungi", "Walter Hucko","Joseph Rossignol","Argele Intili","Ichae Semos","Henry Jurk","Joe Shestak","David King","George Strong","John Klok","Hendrix Svennigsen","Norman Kerman","Fritz Wold","Eugene Kristiansen"]
    
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        serachFriends = Basket.createUserBasketArray()
        self.navigationController?.navigationBar.isHidden = true
        self.noDataFound.isHidden = true
        
        Utils.shared.setLeftPaddingPoints(textFeild: searchField, 55.0)
        Utils.shared.setRightPaddingPoints(textFeild: searchField, 55.0)
        self.searchField.layer.cornerRadius = 25.0
        
        self.searchField.delegate = self
        
        

    }

    //MARK: TableView Delegate.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            if searchedName.count == 0 {
                self.noDataFound.isHidden = false
            }
            else {
                self.noDataFound.isHidden = true
            }
            return searchedName.count
        } else {
            self.noDataFound.isHidden = true
            return nameArr.count
        }    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  self.tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath) as! SearchTableCell
//        let friendData = self.serachFriends[indexPath.row]
//        cell.setFrindsList(friends: friendData)
        cell.searchFriendsImageView.layer.cornerRadius = 10
        if searching {
            cell.searchriendNameLabel.text = searchedName[indexPath.row]
        }else{
            cell.searchriendNameLabel.text = nameArr[indexPath.row]
        }
        cell.addButton.layer.cornerRadius = 8.0
        cell.addButton.setTitleColor(.black, for: .normal)
        cell.addButton.backgroundColor = UIColor(hexString: "#F7B844")

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    //MARK: Searching Code.
    var search = ""
    var timer: Timer?
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
                timer?.invalidate()
                if string.isEmpty
                {
                    search = String(search.dropLast())
                }
                else
                {
                    search = textField.text!+string
                }
                timer = Timer.scheduledTimer(timeInterval: 0.5, target:self, selector:#selector(self.performSearch), userInfo:nil, repeats:false)
                return true
    }
    
    @objc func performSearch() {
            
            searchedName.removeAll()
        if self.searchField.text!.count > 0 {
            searchedName = nameArr.filter({$0.lowercased().prefix(self.searchField.text!.count) == self.searchField.text!.lowercased()})
            searching = true
            tableView.reloadData()

            } else {
                searching = false
            tableView.reloadData()
            }
        }

    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func searchCloseTapped(_ sender: UIButton) {
        
        searching = false
        self.searchField.text = ""
        tableView.reloadData()
    }

}

