//
//  
//  UserListEntity.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 24/05/23.
//
//

import UIKit

struct UserListEntity: ViperEntity {

    //Add your structs here
    
    struct UserView : ViperEntity {
        
        let name: String
        let userName: String
        
        static func create(from user: User) -> UserView {
            return .init(name: user.name, userName: user.username)
        }
        
        var view : UIView {
            UserCell(user: name, userName: userName).hostingControllerView
        }
    }
    
}
