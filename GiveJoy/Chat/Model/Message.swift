//
//  Message.swift
//  Flash Chat
//
//  This is the model class that represents the blueprint for a message

import UIKit

enum SenderType: String {
    case sender = "1"
    case reciever = "2"
    case dateValue = "3"
    case unknown = "0"
}

class Message: NSObject {
    
    var sender: String
    var messageBody: String

    init(sender: String, messageBody: String) {

        self.sender = sender
        self.messageBody = messageBody

    }
    
    convenience init?(dictionary: [String: String]) {
        guard
            
            let sender = dictionary["sender"],
            let messageBody = dictionary["messageBody"]
            else {
                return nil
        }
        
        self.init(sender: sender, messageBody: messageBody)
        
    }

    static func allMessageData() -> [Message] {
        var messageArray = [Message]()
        messageArray.append((Message(sender: SenderType.dateValue.rawValue, messageBody: "")))
        messageArray.append((Message(sender: SenderType.reciever.rawValue, messageBody: "The person who says it cannot be done should not interrupt the person who is doing it.")))
        messageArray.append((Message(sender: SenderType.sender.rawValue, messageBody: "Remember that not getting what you want is sometimes a wonderful stroke of luck.")))
        messageArray.append((Message(sender: SenderType.reciever.rawValue, messageBody: "You can’t use up creativity. The more")))
        messageArray.append((Message(sender: SenderType.reciever.rawValue, messageBody: "The person who says it cannot be done should not interrupt the person who is doing it. The person who says it cannot be done should not interrupt the person who is doing it. The person who says it cannot be done should not interrupt the person who is doing it.")))
        messageArray.append((Message(sender: SenderType.sender.rawValue, messageBody: "Remember that not getting what you want is sometimes a wonderful stroke of luck. Remember that not getting what you want is sometimes a wonderful stroke of luck. Remember that not getting what you want is sometimes a wonderful stroke of luck.")))
        messageArray.append((Message(sender: SenderType.reciever.rawValue, messageBody: "You can’t use up creativity. The more, You can’t use up creativity. The more, You can’t use up creativity. The more, You can’t use up creativity. The more")))
        messageArray.append((Message(sender: SenderType.sender.rawValue, messageBody: "Fine.")))
        messageArray.append((Message(sender: SenderType.reciever.rawValue, messageBody: "Where are you ?")))
        messageArray.append((Message(sender: SenderType.sender.rawValue, messageBody: "I am in office")))
        return messageArray
    }

}
