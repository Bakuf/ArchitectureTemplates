//
//  
//  UserListInteractor.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 24/05/23.
//
//

import UIKit

class UserListInteractor : ViperInteractor {
    
    //
    //MARK: - Viper Protocol
    //
    
    //MARK: Viper objects
    weak var presenter: ViperInteractorToPresenter?
    
    //
    //MARK: - UserListInteractor Specific Variables and Methods
    //
    
    //MARK: UserListInteractor Variables
    var userCells : [User] = []
    
    //MARK: UserListInteractor Methods
    
    
}

//
//MARK: - ViperPresenterToInteractor Protocol
//
extension UserListInteractor : ViperPresenterToInteractor {
    enum Action: ViperInteractorAction { 
        //Add your cases here
        case fetchUsers
    }
    func perform(action: ViperInteractorAction) {
        guard let interactorAction = action as? Action else { return }
        switch interactorAction {
        case .fetchUsers:
            fetchUsers()
        }
    }   
}

//
//MARK: - Fetch Methods
//
extension UserListInteractor {
    
    func fetchUsers() {
        User.makeRequest { [weak self] result in
            switch result {
            case .success(let users):
                self?.userCells = users
                self?.presenter?.interactor(received: users.map({
                    UserListEntity.UserView.create(from:$0)
                }))
            case .failure(let failure):
                print("There was an error fetching the Users \(failure)")
            }
        }
    }
    
}
