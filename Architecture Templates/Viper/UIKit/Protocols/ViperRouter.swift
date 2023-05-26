//
//  ViperRouter.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 19/05/23.
//

import Foundation

protocol ViperRouterPath {}
protocol ViperRouterEvent {}
protocol ViperRouter: AnyObject {
    associatedtype viewType : ViperView
    associatedtype routerType : ViperRouter
    var entry: viewType? { get set }
    static func start() -> routerType
}

protocol ViperRouterToPresenter: AnyObject {
    func route(to path: ViperRouterPath)
}

protocol ViperPresenterToRouter: AnyObject {
    func navigate(to event: ViperRouterEvent)
}
