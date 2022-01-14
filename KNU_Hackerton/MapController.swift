//
//  MapController.swift
//  COVID19
//
//  Created by doyun on 2022/01/14.
//

import Foundation
import UIKit

class MapController:UIViewController {
    
    private let searchbar:UISearchBar = {
        let bar = UISearchBar()
        
        return bar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var map = MTMapView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        view.addSubview(map)
    }
    
    //MARK: - configure
    
    func configureUI() {
        
    }
}
extension MapController:MTMapViewDelegate {
    
}
