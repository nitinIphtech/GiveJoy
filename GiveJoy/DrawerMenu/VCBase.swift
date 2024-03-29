//  Side Menu - VCBase.swift
//  Created by Vikas Ninawe on 12/11/17.
//  Copyright © 2017 VSN. All rights reserved.
//

import UIKit

protocol SideMenuDelegate
{
    func sideMenuItemSelectedAtIndex(_ index : Int32)
}

class VCBase: UIViewController, SideMenuDelegate {
    
    var menuItems = [Dictionary<String,String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sideMenuItemSelectedAtIndex(_ index: Int32)
    {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("Base View Controller is : \(topViewController) \n")
        
        if (menuItems.indices.contains(Int(index)))
        {
            self.openViewControllerBasedOnIdentifier(menuItems[Int(index)]["vc"]!)
        }
    }
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String)
    {
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        self.navigationController!.pushViewController(destViewController, animated: true)
    }
    
    func addSideMenuButton()
    {
        let btnMenu = UIButton.init(type: .custom)
        btnMenu.setImage(UIImage(named: "menu"), for: UIControl.State.normal)
        btnMenu.addTarget(self, action: #selector(self.onSideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        btnMenu.frame = CGRect(x:0, y:0, width:30, height:30)
       
        
        let barButton = UIBarButtonItem(customView: btnMenu)
        self.navigationItem.leftBarButtonItem = barButton
        let filter = UIButton.init(type: .custom)
               filter.setImage(UIImage(named: "filter"), for: UIControl.State.normal)
              // filter.addTarget(self, action: #selector(self.onSideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
               filter.frame = CGRect(x:0, y:0, width:30, height:30)
              
               
               let filterButton = UIBarButtonItem(customView: filter)
               self.navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc func onSideMenuButtonPressed(_ sender : UIBarButtonItem)
    {
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.sideMenuItemSelectedAtIndex(-1);
            sender.tag = 0;
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3,
                           animations: {    () -> Void in
                            var frameMenu : CGRect = viewMenuBack.frame
                            frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                            viewMenuBack.frame = frameMenu
                            viewMenuBack.layoutIfNeeded()
                            viewMenuBack.backgroundColor = UIColor.clear
            },
                           completion: { (finished) -> Void in viewMenuBack.removeFromSuperview()}
            )
            return;
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let VC : VCSideMenu2 = self.storyboard!.instantiateViewController(withIdentifier: "VCSideMenu2") as! VCSideMenu2
        VC.btnMenu = sender
        VC.delegate = self
        
        //self.view.addSubview(VC.view)
        UIApplication.shared.keyWindow?.addSubview(VC.view)
        self.addChild(VC)
        VC.view.layoutIfNeeded()
        
        // Get the menu items(options) list from side menu panel
        self.menuItems = VC.arrayMenuOptions
        
        let scrnDim = UIScreen.main.bounds.size
        VC.view.frame=CGRect(x:0 - scrnDim.width, y:0, width:scrnDim.width, height: scrnDim.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            VC.view.frame=CGRect(x: 0, y: 0, width: scrnDim.width, height: scrnDim.height);
            sender.isEnabled = true
        }, completion:nil)
        
    }
    



}

