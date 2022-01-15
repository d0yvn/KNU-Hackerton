import Foundation
import UIKit
import FloatingPanel

class MapController:UIViewController, FloatingPanelControllerDelegate {
    
    //MARK: - Properties
    
    var fpc: FloatingPanelController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        configureFloatingPanel()
        
    }
    
    //MARK: - configure
    func configureMap(){
        let map = MTMapView(frame: CGRect(x: 0, y: 0,
                                          width: view.frame.size.width, height: view.frame.size.height))
        
//        let mapPoint = MTMapPoint(
        map.delegate = self
        map.baseMapType = .standard
//        map.setMapCenter(MTMapPoint, animated: <#T##Bool#>)
        view.addSubview(map)
        
    }
    func configureFloatingPanel() {
        fpc = FloatingPanelController()
        fpc.delegate = self
        let contentVC = StoreListController()
        fpc.set(contentViewController: contentVC)
        
        //        fpc.track(scrollView: contentVC.tableView)
        
        fpc.addPanel(toParent: self)
        
        fpc.layout = FloatingPanelLayoutWithCustomState()
        fpc.show()
    }
}

class FloatingPanelLayoutWithCustomState: FloatingPanelBottomLayout {
    override var position: FloatingPanelPosition {
        return .bottom
    }
    override var initialState: FloatingPanelState {
        return .tip
    }
    override var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .top, referenceGuide: .safeArea),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
            .tip: FloatingPanelLayoutAnchor(fractionalInset: 0.08, edge: .bottom, referenceGuide: .safeArea)
        ]
    }
}
extension MapController:MTMapViewDelegate {
    
}
