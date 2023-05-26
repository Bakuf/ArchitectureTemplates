//
//  Post.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 13/05/23.
//

import Foundation

struct Post: NetworkModel {
    static var networkRoute: NetworkManager.Routes = .posts
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
