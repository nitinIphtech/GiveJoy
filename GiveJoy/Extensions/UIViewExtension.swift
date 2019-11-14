//
//  UIViewExtension.swift
//  Rendezvous
//
//  Created by iPHTech 33 on 25/03/19.
//  Copyright © 2019 iPHTech 33. All rights reserved.
//

import UIKit

extension UIView{
    
    func setCornerRadiusView(radius:CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    func constraint(byIdentifier identifier: String) -> NSLayoutConstraint? {
        return constraints.first(where: { $0.identifier == identifier })
    }
}
