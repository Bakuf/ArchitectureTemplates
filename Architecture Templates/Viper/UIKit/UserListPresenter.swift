//
//  
//  UserListPresenter.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 24/05/23.
//
//

import UIKit

class UserListPresenter: NSObject, ViperPresenter {
    
    //
    //MARK: - Viper Protocol
    //

    internal init(_ interactor: UserListInteractor) {
        self.interactor = interactor
        super.init()
    }
    
    //MARK: Viper objects
    weak var view: ViperPresenterToView?
    var interactor: ViperPresenterToInteractor
    weak var router: ViperPresenterToRouter? 
    
    //
    //MARK: - UserListPresenter Variables and Methods
    //
    struct Constants {
        static let cellIdentifier = "userCell"
    }
    
    var userViews : [UserListEntity.UserView] = []
    
}


//
//MARK: - ViperViewToPresenter Protocol
//
extension UserListPresenter: ViperViewToPresenter {
    func view(received event: ViperViewEvent) {
        if let lifeCycleEvent = event as? ViperViewLifeCycleEvent {
            switch lifeCycleEvent {
            case .didLoad:
                break
            case .willAppear:
                interactor.perform(action: UserListInteractor.Action.fetchUsers)
            case .didAppear:
                break
            }
        }
        if let viewEvent = event as? UserListView.Event {
            switch viewEvent {
            case .setDelegate(let tableView):
                tableView.dataSource = self
                tableView.delegate = self
            }
        }
    }
}


//
//MARK: - ViperInteractorToPresenter Protocol
//
extension UserListPresenter: ViperInteractorToPresenter {
    func interactor(received entities: [ViperEntity]) {
        if let users = entities as? [UserListEntity.UserView] {
            userViews = users
            view?.update(action: UserListView.Action.reloadTable)
        }
    }
    
    func interactor(failed type: ViperEntity.Type) {
        
    }
}

//
//MARK: - ViperRouterToPresenter Protocol
//
extension UserListPresenter: ViperRouterToPresenter {
    func route(to path: ViperRouterPath) {
        
    }
}


//
//MARK: - UITableViewDelegate
//
extension UserListPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row was selected at indexPath: \(indexPath)")
        router?.navigate(to: UserListRouter.Event.pushToNewUserList)
    }
    
}

//
//MARK: - UITableViewDataSource
//
extension UserListPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier)
        if cell == nil {
            cell = .init(style: .subtitle, reuseIdentifier: Constants.cellIdentifier)
        }
        let user = userViews[indexPath.row]
        cell?.contentView.removeAllSubviews()
        cell?.contentView.addSubviewWithBorderLayout(subView: user.view)
        
        return cell ?? .init()
    }
    
}
