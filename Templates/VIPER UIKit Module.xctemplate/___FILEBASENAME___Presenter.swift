//
//  ___FILEHEADER___
//

import UIKit

class ___VARIABLE_productName:identifier___Presenter: ViperPresenter {
    
    //
    //MARK: - Viper Protocol
    //

    internal init(_ interactor: ___VARIABLE_productName:identifier___Interactor) {
        self.interactor = interactor
        super.init()
    }
    
    //MARK: Viper objects
    weak var view: ViperPresenterToView?
    var interactor: ViperPresenterToInteractor
    weak var router: ViperPresenterToRouter?
    
    //
    //MARK: - ___VARIABLE_productName:identifier___Presenter Variables and Methods
    //
    
}


//
//MARK: - ViperViewToPresenter Protocol
//
extension ___VARIABLE_productName:identifier___Presenter: ViperViewToPresenter {
    func view(received event: ViperViewEvent) {
        if let lifeCycleEvent = event as? ViperViewLifeCycleEvent {
            switch lifeCycleEvent {
            case .didLoad:
                break
            case .willAppear:
                break
            case .didAppear:
                break
            }
        }
        if let viewEvent = event as? ___VARIABLE_productName:identifier___View.Event {
            switch viewEvent {
            default:
            break
            }
        }
    }
}


//
//MARK: - ViperInteractorToPresenter Protocol
//
extension ___VARIABLE_productName:identifier___Presenter: ViperInteractorToPresenter {
    func interactor(received entities: [ViperEntity]) {
        
    }
    
    func interactor(failed type: ViperEntity.Type) {
        
    }
}

//
//MARK: - ViperRouterToPresenter Protocol
//
extension ___VARIABLE_productName:identifier___Presenter: ViperRouterToPresenter {
    func route(to path: ViperRouterPath) {
        
    }
}
