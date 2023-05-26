//
//  
//  UserListView.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 24/05/23.
//
//

import Foundation
import UIKit

class UserListView: UIViewController, ViperView {
    
    //MARK: - Init Methods
    internal init(_ presenter: UserListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    //For compatibilty with storyboards and xibs if needed
    required init?(coder: NSCoder) {
        let router = UserListRouter.start()
        UIManager.shared.currentRouter = router //If you use storyboards or xibs you need to hold the Router somewhere or else it's gonna be released
        if let presenter = router.presenter as? UserListPresenter {
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
        case setDelegate(to: UITableView)
    }
    
    //
    //MARK: - UserListView Specific Variables and Methods
    //
    
    //MARK: UserListView Variables
    fileprivate var tableView: UITableView = .init(frame: .zero, style: .plain)
    
    //MARK: UserListView Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view(received: ViperViewLifeCycleEvent.didLoad)
        addTableView()
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
extension UserListView: ViperPresenterToView {
    enum Action : ViperViewAction {
        //add your cases here
        case reloadTable
    }
    func update(action: ViperViewAction) {
        guard let viewAction = action as? Action else { return }
        switch viewAction {
        case .reloadTable:
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        break
        }
    }
}

extension UserListView {
    
    func addTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        presenter.view(received: Event.setDelegate(to: tableView))
        tableView.separatorStyle = .none
    }
    
}
