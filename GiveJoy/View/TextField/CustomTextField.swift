//
//  CustomTextField.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 09/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    let color = UIColor(hexString: "#F1F1F6")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setShadow()
    }
    
    public func setAttributedPlaceHolder(text:String, color: UIColor = UIColor(hexString: PLACEHOLDER_COLOR)){
        self.attributedPlaceholder = NSAttributedString(string: text,attributes: [NSAttributedString.Key.foregroundColor: color])
    }

    private func setupView(){
        self.backgroundColor = color
        self.font = UIFont(name:  FontName.LATO_BOLD.rawValue, size: 16.0)
        self.textColor = UIColor.black
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.clipsToBounds = false
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
     func setShadow(){
        
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = false
        
//        self.layer.shadowRadius = 5.0
//        self.layer.shadowColor = UIColor(hexString: "#EAEBEF").cgColor
//        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        self.layer.shadowOpacity = 0.8
        

        self.layer.shadowColor = UIColor(hexString: "#EAEBEF").cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 8
        self.textColor = color



    }
   public func setBackGroundColor(color:UIColor)
    {
        self.backgroundColor = color
        
    }
}
