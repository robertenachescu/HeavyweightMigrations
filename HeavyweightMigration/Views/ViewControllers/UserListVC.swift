//
//  UserListVC.swift
//  HeavyweightMigration
//
//  Created by Robert Enachescu on 23.03.2021.
//

import UIKit

class UserListVC: UIViewController {
    
    //  MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //  MARK: - Variables
    lazy var userListViewModel: UserListViewModel = UserListViewModel()
    
    //  MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
    }
    
    //  MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
    
    //  MARK: - IBActions
    @IBAction func addBtnPressed(_ sender: Any) {
        userListViewModel.addRandomUsers()
    }
    
    //  MARK: - VC Methods
    private func setupScreen() {
        tableView.dataSource = self
        tableView.rowHeight = 100
        
        userListViewModel.userListViewModelErrorDelegate = self
        
        userListViewModel.users.bind(listener: { [weak self] newUsers in
            self?.tableView.reloadData()
        })
    }
    
}

//  MARK: - UITableViewDataSource
extension UserListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userListViewModel.users.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FlagCell = tableView.dequeueReusableCell(withIdentifier: FlagCell.identifier, for: indexPath) as! FlagCell
        
        cell.loadCellWithDetails(from: userListViewModel.users.value[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            PersistenceService.sharedInstance.deleteEntry(userListViewModel.users.value[indexPath.row])
            userListViewModel.fetchUsers()
        }
    }
}

//  MARK: - UserListViewModelErrorDelegate
extension UserListVC: UserListViewModelErrorDelegate {
    func errorAppeared(title: String, message: String) {
        AlertHelper.showAlertMessage(vc: self, message: message, handler: {})
    }
}

