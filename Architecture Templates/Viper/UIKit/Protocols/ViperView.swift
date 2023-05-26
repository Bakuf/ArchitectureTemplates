//
//  ViperView.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 19/05/23.
//

import Foundation

protocol ViperViewAction {}
protocol ViperViewEvent {}
protocol ViperView: AnyObject {
    var presenter: ViperViewToPresenter { get set }
}

protocol ViperPresenterToView: AnyObject {
    func update(action: ViperViewAction)
}

enum ViperViewLifeCycleEvent : ViperViewEvent {
    case didLoad
    case willAppear
    case didAppear
}
