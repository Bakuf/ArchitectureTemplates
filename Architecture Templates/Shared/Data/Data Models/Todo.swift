//
//  Todos.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 13/05/23.
//

import Foundation

struct Todo: NetworkModel {
    static var networkRoute: NetworkManager.Routes = .todos
    
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
