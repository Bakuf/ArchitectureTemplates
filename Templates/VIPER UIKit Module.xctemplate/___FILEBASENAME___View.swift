//
//  ___FILEHEADER___
//

import Foundation
import UIKit

class ___VARIABLE_productName:identifier___View: UIViewController, ViperView {
    
    //MARK: - Init Methods
    internal init(_ presenter: ___VARIABLE_productName:identifier___Presenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    //For compatibilty with storyboards and xibs if needed
    required init?(coder: NSCoder) {
        let router = ___VARIABLE_productName:identifier___Router.start()
        //UIManager.shared.currentRouter = router //If you use storyboards or xibs you need to hold the Router somewhere or else it's gonna be released
        if let presenter = router.presenter as? ___VARIABLE_productName:identifier___Presenter {
            self.presenter = presenter
            super.init(coder: coder)
            presenter.view = self
            router.entry = self
        }else{
            fatalError("Presenter was not found")
        }
    }

    //
    //MARK: - Viper Protocol
    //
    
    //MARK: Viper objects
    var presenter: ViperViewToPresenter
    
    enum Event : ViperViewEvent {
        //add your cases here
    }
    
    //
    //MARK: - ___VARIABLE_productName:identifier___View Specific Variables and Methods
    //
    
    //MARK: ___VARIABLE_productName:identifier___View Variables
    
    
    //MARK: ___VARIABLE_productName:identifier___View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view(received: ViperViewLifeCycleEvent.didLoad)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.view(received: ViperViewLifeCycleEvent.willAppear)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.view(received: ViperViewLifeCycleEvent.didAppear)
    }
    
    
}

//
//MARK: - ViperPresenterToView Protocol
//
extension ___VARIABLE_productName:identifier___View: ViperPresenterToView {
    enum Action : ViperViewAction {
        //add your cases here
    }
    func update(action: ViperViewAction) {
        guard let viewAction = action as? Action else { return }
        switch viewAction {
        default:
        break
        }
    }
}
