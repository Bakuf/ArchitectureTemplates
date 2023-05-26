//
//  Comment.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 13/05/23.
//

import Foundation

struct Comment: NetworkModel {
    static var networkRoute: NetworkManager.Routes = .comments
    
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
