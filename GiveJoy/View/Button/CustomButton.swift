//
//  CustomButton.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 09/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    let color = UIColor(hexString: YELLOW_BG)
    public var isActive:Bool = false
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView(){
        self.backgroundColor = color
//        self.setTitleColor(UIColor.white, for: .normal)
//        self.titleLabel?.font = UIFont(name: FontName.LATO_BLACK.rawValue, size: 16.0)
        self.setCornerRadius()
    }
    
    public func setBackGroundColor(color:UIColor){
        self.backgroundColor = color
    }
    
    public func setCornerRadius(radius:CGFloat = 10.0){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    public func setBorder(color:UIColor,width:CGFloat = 2.0){
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    public func setActive(){
        self.backgroundColor = UIColor(hexString: ACTIVE_COLOR)
        self.setTitleColor(UIColor.white, for: .normal)
        isActive = true
    }
    
    public func setActive(withTitle:String){
        self.setActive()
        self.setTitle(withTitle, for: .normal)
        self.addTextSpacing(spacing: 2.0, stringValue: withTitle)
    }
    
    public func setInactive(){
        self.backgroundColor = UIColor(hexString: INACTIVE_COLOR)
        self.setTitleColor(UIColor.white, for: .normal)
        isActive = false
    }
    
    public func setInActive(withTitle:String){
        self.setInactive()
        self.setTitle(withTitle, for: .normal)
        self.addTextSpacing(spacing: 2.0, stringValue: withTitle)
    }
    
    func addTextSpacing(spacing: CGFloat, stringValue: String){
        let attributedString = NSMutableAttributedString(string: stringValue)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSRange(location: 0, length: (stringValue.count)))
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    //for few specific buttons
    
    public func setActiveButton(withTitle:String){
        // self.setActive()
        
        self.backgroundColor = UIColor(hexString: YELLOW_BG)
        self.setTitleColor(UIColor(hexString: ACTIVE_COLOR), for: .normal)
        isActive = true
        self.setTitle(withTitle, for: .normal)
        self.addTextSpacing(spacing: 2.0, stringValue: withTitle)
    }
    
    public func setInActiveButton(withTitle:String){
        //   self.setInactive()
        self.backgroundColor = UIColor(hexString: INACTIVE_COLOR_BUTTON)
        self.setTitleColor(UIColor.lightGray, for: .normal)
        isActive = false
        self.setTitle(withTitle, for: .normal)
        self.addTextSpacing(spacing: 2.0, stringValue: withTitle)
    }
    
}
