//
//  StoreListView.swift
//  KNU_Hackerton
//
//  Created by doyun on 2022/01/14.
//

import UIKit

private let reuseIdentifier = "StoreCell"
class StoreListController: UITableViewController {
    
    //MARK: - Properties
    private var isSearchMode:Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(StoreCell.self, forCellReuseIdentifier: reuseIdentifier)
        configureSearchController()
        
    }

 
    //MARK: - configure
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a user"
        self.tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = false
    }
}
extension StoreListController:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        print(searchText)
//        filterdUsers = users.filter({ $0.username.contains(searchText)})
    }
}

extension StoreListController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? StoreCell else { return UITableViewCell()}
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
