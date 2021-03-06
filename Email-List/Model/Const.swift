//
//  Constants.swift
//  Email-List
//
//  Created by Sergey Borisov on 21.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import Foundation

struct Const {
    
    static let mainStoryboardName = "Main"
    static let cellID = "ReusableCell"
    static let cellNibName = "EmailCell"
    static let dateFormat = "dd MMM yyyy"
    
    struct Segue {
    
        static let registerToList = "RegisterToList"
        static let registerToLogIn = "RegisterToLogIn"
        static let registerToTip = "RegisterToTipVC"
        static let logInToList = "LogInToList"
        static let logInToTip = "logInToTipVC"
    }
    
    struct Sender {
        static let email = "email"
        static let password = "password"
        static let confirm = "confirm"
    }
    
    struct VCID {
        
        static let register = "RegisterViewController"
        static let list = "ListViewController"
    }
    
    struct FStore {
        
        static let collectionName = "emails"
        static let avatarField = "avatarURL"
        static let senderField = "sender"
        static let subTitleField = "subTitle"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
