//
//  Uitlity.swift
//  GiveJoy
//
//  Created by SADDAM KHAN on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit
import Foundation

class Utils: NSObject {
    
    static let shared = Utils()
    
    //MARK: Return index path.
    func getIndexPathFrom(object: AnyObject, sender: AnyObject) -> IndexPath?{
        
        if let tableview = object as? UITableView{
            
            let senderPosition:CGPoint = sender.convert(CGPoint.zero, to: tableview)
            let indexPath = tableview.indexPathForRow(at: senderPosition)
            return indexPath
        }
        else if let collectionView = object as? UICollectionView{
            
            let senderPosition:CGPoint = sender.convert(CGPoint.zero, to: collectionView)
            let indexPath = collectionView.indexPathForItem(at: senderPosition)
            return indexPath
        }
        
        return nil
    }

    func setLeftPaddingPoints(textFeild: UITextField,_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: textFeild.frame.size.height))
        textFeild.leftView = paddingView
        textFeild.leftViewMode = .always
    }

    func setRightPaddingPoints(textFeild: UITextField,_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: textFeild.frame.size.height))
        textFeild.rightView = paddingView
        textFeild.rightViewMode = .always
    }

}
