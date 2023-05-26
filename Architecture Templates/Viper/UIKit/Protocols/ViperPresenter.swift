//
//  ViperPresenter.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 19/05/23.
//

import Foundation

protocol ViperPresenter: AnyObject {
    var router: ViperPresenterToRouter? { get set }
    var interactor: ViperPresenterToInteractor { get set }
    var view: ViperPresenterToView? { get set }
}

protocol ViperViewToPresenter: AnyObject {
    func view(received event: ViperViewEvent)
}

protocol ViperInteractorToPresenter: AnyObject {
    func interactor(received entities: [ViperEntity])
    func interactor(failed type: ViperEntity.Type)
}
