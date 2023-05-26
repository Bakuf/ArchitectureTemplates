//
//  ___FILEHEADER___
//

import Foundation
import UIKit

class ___VARIABLE_productName:identifier___Router: ViperRouter {
    
    //
    //MARK: - Viper Protocol
    //
    
    //MARK: Viper objects
    var entry: ___VARIABLE_productName:identifier___View?
    weak var presenter: ViperRouterToPresenter?
    
    //MARK: Viper Methods
    static func start() -> ___VARIABLE_productName:identifier___Router {
        let router = ___VARIABLE_productName:identifier___Router()
        // Assign VIP
        let interactor = ___VARIABLE_productName:identifier___Interactor()
        let presenter = ___VARIABLE_productName:identifier___Presenter(interactor)
        let view = ___VARIABLE_productName:identifier___View(presenter)
        
        //View needs presenter
        view.presenter = presenter
        
        //Interactor needs presenter
        interactor.presenter = presenter
        
        //Presenter needs router, view and interactor
        presenter.view = view
        presenter.router = router
        
        //router needs entry point (a.k.a view)
        router.entry = view
        router.presenter = presenter
        
        return router
    }
    
}

extension ___VARIABLE_productName:identifier___Router: ViperRouterToPresenter {
    
    enum Route: ViperRouterPath {
        //add your cases here
    }
    
    func route(to path: ViperRouterPath) {
        presenter?.route(to: path)
    }
    
}

extension ___VARIABLE_productName:identifier___Router: ViperPresenterToRouter {
    
    enum Event: ViperRouterEvent { 
        //add your cases here
    }
    
    func navigate(to event: ViperRouterEvent) {
        guard let event = event as? Event else { return }
        switch event {
        default:
        break
        }
    }
    
}
