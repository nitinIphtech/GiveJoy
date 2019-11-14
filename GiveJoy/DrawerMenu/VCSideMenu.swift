//  Side Menu - VCSideMenu.swift
//  Created by Vikas Ninawe on 12/11/17.
//  Copyright © 2017 VSN. All rights reserved.
//

import UIKit

class VCSideMenu: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tblVwMenuOptions: UITableView!
    @IBOutlet weak var vwSidePanel: UIView!
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    
    var arrayMenuOptions = [Dictionary<String,String>]()
    var btnMenu : UIBarButtonItem!
    var delegate : SideMenuDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tblVwMenuOptions.dataSource = self
        tblVwMenuOptions.delegate = self
        tblVwMenuOptions.backgroundColor = UIColor.clear
        
        imgProfilePic.layer.cornerRadius = 20
        imgProfilePic.clipsToBounds = true
        transferButton.layer.cornerRadius = 17.5
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        updateArrayMenuOptions()
    }
    
   
    func updateArrayMenuOptions()
    {
        arrayMenuOptions.append(["title":"Home", "icon":"home", "vc":"HomeViewController"])
        arrayMenuOptions.append(["title":"Edit Profile", "icon":"editProfile", "vc":"EditProfileViewController"])
        arrayMenuOptions.append(["title":"Store", "icon":"store", "vc":"StoreViewController2"])
        arrayMenuOptions.append(["title":"Basket", "icon":"basket", "vc":"BasketViewController"])
        arrayMenuOptions.append(["title":"My Gift", "icon":"myGifts", "vc":"MyGiftsViewController"])
        arrayMenuOptions.append(["title":"Create Post", "icon":"editProfile", "vc":"CreatePostViewController"])
        arrayMenuOptions.append(["title":"Friends", "icon":"editProfile", "vc":"FriendsViewController"])
        arrayMenuOptions.append(["title":"Settings", "icon":"settings", "vc":"SettingsViewController"])
        arrayMenuOptions.append(["title":"Terms", "icon":"editProfile", "vc":"TermOfUseViewController"])
         arrayMenuOptions.append(["title":"Message", "icon":"editProfile", "vc":"ChatViewController"])
        
        tblVwMenuOptions.reloadData()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!)
    {
        btnMenu.tag = 0
        
        if (self.delegate != nil)
        {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay)
            {
                index = -1
            }
            delegate?.sideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations:
            { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
        },completion:
            {   (finished) -> Void in
                self.view.removeFromSuperview() //@ need to check
                self.removeFromParent()
        })
    }
    
    //MARK: TableView Delegate.

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.backgroundColor = UIColor.clear
        
        let imgIcon : UIImageView = cell.contentView.viewWithTag(100) as! UIImageView
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        
        imgIcon.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(UIDevice.current.userInterfaceIdiom == .pad)
        {
            return 65;
        }
        return 50;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayMenuOptions.count;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    @IBAction func loogOutBUttonTapped(_ sender:UIButton) {

        btnMenu.tag = 0
        
//        if (self.delegate != nil)
//        {
//            var index = Int32(button.tag)
//            if(button == self.btnCloseMenuOverlay)
//            {
//                index = -1
//            }
//            delegate?.sideMenuItemSelectedAtIndex(index)
//        }
        
        UIView.animate(withDuration: 0.3, animations:
            { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
        },completion:
            {   (finished) -> Void in
                self.view.removeFromSuperview() //@ need to check
                self.removeFromParent()
        })
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LogoutViewController") as! LogoutViewController

        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve

        present(vc, animated: true, completion: nil)

    }

    @IBAction func transferToBankButtonTapped(_ sender: UIButton) {
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations:
            { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
        },completion:
            {   (finished) -> Void in
                self.view.removeFromSuperview() //@ need to check
                self.removeFromParent()
        })

        let destination = self.storyboard?.instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        self.navigationController?.pushViewController(destination, animated: true)
    }
    @IBAction func searchButtonTapped(_ sender: Any) {
        
        btnMenu.tag = 0
        
//        if (self.delegate != nil)
//        {
//            var index = Int32(button.tag)
//            if(button == self.btnCloseMenuOverlay)
//            {
//                index = -1
//            }
//            delegate?.sideMenuItemSelectedAtIndex(index)
//        }
        
        UIView.animate(withDuration: 0.3, animations:
            { () -> Void in
                self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor.clear
        },completion:
            {   (finished) -> Void in
                self.view.removeFromSuperview() //@ need to check
                self.removeFromParent()
        })

        
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "SearchFriendsViewController") as! SearchFriendsViewController
               self.navigationController?.pushViewController(destination, animated: true)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
