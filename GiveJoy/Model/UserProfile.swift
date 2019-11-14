//
//  UserProfile.swift
//  GiveJoy
//
//  Created by Nitin Sharma on 16/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import Foundation
import UIKit

class UserDetails{
    var image: UIImage?
    var title: String?
    var description: String?
    init(image: UIImage,title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
    class func createUserDetailsArray() -> [UserDetails] {
        var user : [UserDetails] = []
        let users = UserDetails(image: UIImage(named: "ProfileImage")!, title: "Burns Marks", description: "")
        let users2 = UserDetails(image: UIImage(named: "ProfileImage")!, title: "Grant Marshall", description: "")
        let users3 = UserDetails(image: UIImage(named: "ProfileImage")!, title: "Julia Petersen", description: "")
        let users4 = UserDetails(image: UIImage(named: "ProfileImage")!, title: "Duran Clayton", description: "")
        let users5 = UserDetails(image: UIImage(named: "ProfileImage")!, title: "Aurelien Salomon", description: "")
        let users6 = UserDetails(image: UIImage(named: "ProfileImage")!, title: "Marie Winter", description: "")
        user.append(users)
        user.append(users2)
        user.append(users3)
        user.append(users4)
        user.append(users5)
        user.append(users6)


        return user
    }
}
