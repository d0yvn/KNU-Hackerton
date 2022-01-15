//
//  MapController.swift
//  COVID19
//
//  Created by doyun on 2022/01/14.
//

import Foundation
import UIKit

class MapController:UIViewController {
    
    //MARK: - Properties
    private var isSearchMode:Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let map = MTMapView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        view.addSubview(map)
        configureSearchController()
    }
    
    //MARK: - configure
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search for a user"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}
extension MapController:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        print(searchText)
//        filterdUsers = users.filter({ $0.username.contains(searchText)})
    }
}
extension MapController:MTMapViewDelegate {
    
}
