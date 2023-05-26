//
//  
//  UserListRouter.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 24/05/23.
//
//

import Foundation
import UIKit
import SwiftUI

class UserListRouter: ViperRouter {
    
    //
    //MARK: - Viper Protocol
    //
    
    //MARK: Viper objects
    var entry: UserListView?
    weak var presenter: ViperRouterToPresenter?
    
    //MARK: Viper Methods
    static func start() -> UserListRouter {
        let router = UserListRouter()
        // Assign VIP
        let interactor = UserListInteractor()
        let presenter = UserListPresenter(interactor)
        let view = UserListView(presenter)
        
        //View needs presenter
        view.presenter = presenter
        
        //Interactor needs presenter
        interactor.presenter = presenter
        
        //Presenter needs router and view
        presenter.view = view
        presenter.router = router
        
        //router needs entry point (a.k.a view)
        router.entry = view
        router.presenter = presenter
        
        return router
    }
    
}

extension UserListRouter: ViperRouterToPresenter {
    
    enum Route: ViperRouterPath {
        //add your cases here
    }
    
    func route(to path: ViperRouterPath) {
        presenter?.route(to: path)
    }
    
}

extension UserListRouter: ViperPresenterToRouter {
    
    enum Event: ViperRouterEvent { 
        //add your cases here
        case pushToNewUserList
    }
    
    func navigate(to event: ViperRouterEvent) {
        guard let event = event as? Event else { return }
        switch event {
        case .pushToNewUserList:
            if let vc = UserListRouter.start().entry {
                entry?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
