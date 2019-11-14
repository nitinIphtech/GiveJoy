//
//  ChatListModel.swift
//  GiveJoy
//
//  Created by SADDAM KHAN on 21/10/19.
//  Copyright © 2019 Nitin Sharma. All rights reserved.
//

import UIKit

class ChatList: NSObject {
    
    var userId: String
    var userFirstName: String
    var userLastName: String
    var userName: String {
      get {
        return "\(userFirstName) \(userLastName)"
      }
    }
    var userPic: String
    var userDesc: String
    var onlineStatus: String
    
    init(userId: String, userFirstName: String, userLastName: String, userPic: String, userDesc: String, onlineStatus: String) {
        
        self.userId = userId
        self.userFirstName = userFirstName
        self.userLastName = userLastName
        self.userPic = userPic
        self.userDesc = userDesc
        self.onlineStatus = onlineStatus
        
    }
    
    convenience init?(dictionary: [String: String]) {
        guard
            
            let userId = dictionary["userId"],
            let userFirstName = dictionary["userFirstName"],
            let userLastName = dictionary["userLastName"],
            let userPic = dictionary["userPic"],
            let userDesc = dictionary["userDesc"],
            let onlineStatus = dictionary["onlineStatus"]
            else {
                return nil
        }
        
        self.init(userId: userId, userFirstName: userFirstName, userLastName: userLastName, userPic: userPic, userDesc: userDesc, onlineStatus: onlineStatus)
    }
    
    static func allChatListData() -> [ChatList] {
        var chatList = [ChatList]()

        chatList.append(ChatList(userId: "101", userFirstName: "Marie", userLastName: "Winter", userPic: "james", userDesc: "Happiness is not something readymade.", onlineStatus: "1"))
        chatList.append(ChatList(userId: "102", userFirstName: "Grant", userLastName: "Marshall", userPic: "james", userDesc: "When I let go of what I am, I become.", onlineStatus: "1"))
        chatList.append(ChatList(userId: "103", userFirstName: "Duran", userLastName: "Clayton", userPic: "james", userDesc: "If you’re offered a seat on a rocket ship,", onlineStatus: "0"))
        chatList.append(ChatList(userId: "104", userFirstName: "Julia", userLastName: "Petersen", userPic: "james", userDesc: "Happiness is not something readymade.", onlineStatus: "0"))
        chatList.append(ChatList(userId: "105", userFirstName: "Burns", userLastName: "Makes", userPic: "james", userDesc: "When I let go of what I am, I become.", onlineStatus: "0"))
        return chatList
    }

}
