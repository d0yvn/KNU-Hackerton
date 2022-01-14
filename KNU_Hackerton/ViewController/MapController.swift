//
//  MapController.swift
//  COVID19
//
//  Created by doyun on 2022/01/14.
//

import Foundation
import UIKit

class MapController:UIViewController {
    

    var mapView : MTMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MTMapView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
    }
}
extension MapController:MTMapViewDelegate {
    
}
