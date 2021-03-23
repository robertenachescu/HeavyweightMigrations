//
//  UserListViewModel.swift
//  HeavyweightMigration
//
//  Created by Robert Enachescu on 23.03.2021.
//

import Foundation

protocol UserListViewModelErrorDelegate {
    func errorAppeared(title: String, message: String)
}

struct UserListViewModel {
    
    //  MARK: - Initializers
    init() {
        fetchUsers()
    }
    
    //  MARK: - Protocols
    var userListViewModelErrorDelegate: UserListViewModelErrorDelegate?
    
    //  MARK: - Observables
    var users: Observable<[InternationalUser]> = Observable([])
    
    //  MARK: - VM Methods
    func fetchUsers() {
        users.value = InternationalUser.getAllUsers()
    }
    
    func addRandomUsers() {
        InternationalUser.saveUserWith(ageOf: 24, name: "Robu", country: .Romania, sex: .Male)
        InternationalUser.saveUserWith(ageOf: 24, name: "Mada", country: .Romania, sex: .Female)
        InternationalUser.saveUserWith(ageOf: 40, name: "Nicky Jam", country: .World, sex: .Male)
        InternationalUser.saveUserWith(ageOf: 35, name: "J Balvin", country: .Colombia, sex: .Male)
        InternationalUser.saveUserWith(ageOf: 27, name: "Maluma", country: .Colombia, sex: .Male)
        InternationalUser.saveUserWith(ageOf: 45, name: "Daddy Yankee", country: .World, sex: .Male)
                
        userListViewModelErrorDelegate?.errorAppeared(title: "Completed", message: "Random users were added")
        
        fetchUsers()
    }
}
