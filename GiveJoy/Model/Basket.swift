//
//  Basket.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import Foundation
import UIKit

class Basket {
    var image: UIImage?
    var title: String?
    var amount: String?
    var description: String?
    var productCount: String?
    var location: String?
    var name: String?
    init(image: UIImage,title: String, description: String,amount:String,productCount: String,location:String,name:String) {
        self.image = image
        self.title = title
        self.description = description
        self.amount = amount
        self.productCount = productCount
        self.location = location
        self.name = name
        
    }
    class func createUserBasketArray() -> [Basket] {
        var baskets : [Basket] = []
        let users = Basket(image: UIImage(named: "tutorial_1")!, title: "Tag Hever Wristwatch", description: "", amount: "$1100", productCount: "3", location: "CANADA", name: "Burns Marks")
        let users2 = Basket(image: UIImage(named: "user")!, title: "BeoPlay Speaker", description: "", amount: "$450", productCount: "2", location: "INDIA", name: "Grant Marshall")
        let users3 = Basket(image: UIImage(named: "treamer")!, title: "Electric Kettle", description: "", amount: "$95", productCount: "1", location: "US", name: "Julia Petersen")
        let users4 = Basket(image: UIImage(named: "user")!, title: "Bang & Olufsen Case", description: "", amount: "$120", productCount: "1", location: "UK", name: "Duran Clayton")
        let users5 = Basket(image: UIImage(named: "tutorial_1")!, title: "Smart Home Speaker", description: "", amount: "$95", productCount: "3", location: "JAPAN", name: "Aurelien Salomon")
        let users6 = Basket(image: UIImage(named: "user")!, title: "BeoPlay Speaker", description: "", amount: "$95", productCount: "2", location: "CHINA", name: "Marie Winter")
        let users7 = Basket(image: UIImage(named: "user")!, title: "BeoPlay Speaker", description: "", amount: "$95", productCount: "2", location: "RUSH", name: "Johna")
        let users8 = Basket(image: UIImage(named: "user")!, title: "BeoPlay Speaker", description: "", amount: "$95", productCount: "2", location: "FRANCH", name: "Rock")
        let users9 = Basket(image: UIImage(named: "user")!, title: "BeoPlay Speaker", description: "", amount: "$95", productCount: "2", location: "AUSTRALIA", name: "Martin")


        baskets.append(users)
        baskets.append(users2)
        baskets.append(users3)
        baskets.append(users4)
        baskets.append(users5)
        baskets.append(users6)
        baskets.append(users7)
        baskets.append(users8)
        baskets.append(users9)

        return baskets
    }
}
