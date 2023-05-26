//
//  ViperInteractor.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 19/05/23.
//

import Foundation

protocol ViperInteractorAction {}
protocol ViperInteractor: AnyObject {
    var presenter: ViperInteractorToPresenter? { get set }
}

protocol ViperPresenterToInteractor: AnyObject {
    func perform(action: ViperInteractorAction)
}
