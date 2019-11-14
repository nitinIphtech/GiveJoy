//
//  VCExtension.swift
//  Rendezvous
//
//  Created by iPHTech 33 on 16/03/19.
//  Copyright © 2019 iPHTech 33. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func showAlert(withMsg:String,Title:String = "Oops!",completion:@escaping ()->Void){
        
        DispatchQueue.main.async {
        let alertController = UIAlertController(title: Title, message: withMsg, preferredStyle: .alert)
        
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: Title as String, attributes: [NSAttributedString.Key.font:UIFont(name: FontName.LATO_BLACK.rawValue, size: 18.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: THEME_COLOR), range: NSRange(location:0,length:Title.count))
        alertController.setValue(myMutableString, forKey: "attributedTitle")
        
        // Change Message With Color and Font
        
        var messageMutableString = NSMutableAttributedString()
        messageMutableString = NSMutableAttributedString(string: withMsg as String, attributes: [NSAttributedString.Key.font:UIFont(name: FontName.LATO_BLACK.rawValue, size: 14.0)!])
        messageMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(hexString: ERROR_COLOR), range: NSRange(location:0,length:withMsg.count))
        alertController.setValue(messageMutableString, forKey: "attributedMessage")
        
        
        // Action.
        let okAction = UIAlertAction(title: "Ok", style: .cancel){ (action) in
            completion()
        }
        
        okAction.setValue(UIColor(hexString: THEME_COLOR), forKey: "titleTextColor")
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        }
    }
}
