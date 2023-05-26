//
//  UIManager.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 23/05/23.
//

import Foundation

class UIManager {
    static let shared: UIManager = .init()
    
    var currentRouter: (any ViperRouter)?
}
