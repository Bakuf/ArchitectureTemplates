//
//  ___FILEHEADER___
//

import UIKit

class ___VARIABLE_productName:identifier___Interactor : ViperInteractor {
    
    //
    //MARK: - Viper Protocol
    //
    
    //MARK: Viper objects
    weak var presenter: ViperInteractorToPresenter?
    
    //
    //MARK: - ___VARIABLE_productName:identifier___Interactor Specific Variables and Methods
    //
    
    //MARK: ___VARIABLE_productName:identifier___Interactor Variables
    
    
    //MARK: ___VARIABLE_productName:identifier___Interactor Methods
    
    
}

//
//MARK: - ViperPresenterToInteractor Protocol
//
extension ___VARIABLE_productName:identifier___Interactor : ViperPresenterToInteractor {
    enum Action: ViperInteractorAction { 
        //Add your cases here
    }
    func perform(action: ViperInteractorAction) {
        guard let interactorAction = action as? Action else { return }
        switch interactorAction {
        default:
        break
        }
    }   
}
