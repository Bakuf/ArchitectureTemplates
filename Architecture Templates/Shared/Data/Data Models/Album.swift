//
//  Album.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 13/05/23.
//

import Foundation

struct Album: NetworkModel {
    static var networkRoute: NetworkManager.Routes = .albums
    
    var userId: Int
    var id: Int
    var title: String
}
