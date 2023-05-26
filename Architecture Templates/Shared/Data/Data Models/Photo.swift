//
//  Photo.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 13/05/23.
//

import Foundation

struct Photo: NetworkModel {
    static var networkRoute: NetworkManager.Routes = .photos
    
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
