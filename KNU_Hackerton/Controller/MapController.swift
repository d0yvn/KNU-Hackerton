import Foundation
import UIKit
import FloatingPanel
import CoreLocation

protocol MapControllerDelegate:class {
    func updateSearchBar(_ state: FloatingPanelState)
}
class MapController:UIViewController, FloatingPanelControllerDelegate {
    
    //MARK: - Properties
    
    weak var delegate:MapControllerDelegate?
    
    private var fpc: FloatingPanelController!
    private var locationManager : CLLocationManager?
    private var mapView:MTMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMap()
        configureFloatingPanel()
        configureCLLocation()
    }
    
    //MARK: - configure
    func configureMap(){
        mapView = MTMapView(frame: view.frame)
        let mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude: 36.151546, longitude: 128.331775))
        
        mapView.delegate = self
        mapView.baseMapType = .standard
        
        // 중심 지도 이동.
        mapView.setMapCenter(mapPoint, animated: true)
//        mapView.updateCurrentLocationMarker(MTMapLocationMarkerItem)
        
        //현재 위치 트래킹
        mapView.showCurrentLocationMarker = true
        mapView.currentLocationTrackingMode = .onWithHeading
        
        //marker 표시
        let poitItem1 = MTMapPOIItem()
        poitItem1.itemName = "마커 확인용!"
        poitItem1.mapPoint = mapPoint
        poitItem1.markerType = .redPin
        
        mapView.add(poitItem1)
        
        view.addSubview(mapView)
        
        print("MTMapView : \(poitItem1.mapPoint!.mapPointGeo())")
        guard let centerPoint = mapView.mapCenterPoint else { return}
        print("MTMapView : \(centerPoint.mapPointGeo())")   
    }
    
    
    func configureFloatingPanel() {
        fpc = FloatingPanelController()
        fpc.delegate = self
        let contentVC = StoreListController()
        fpc.set(contentViewController: contentVC)
        
        //        fpc.track(scrollView: contentVC.tableView)
        
        fpc.addPanel(toParent: self)
        
        fpc.layout = FloatingPanelLayoutWithCustomState()
        print("DEBUG : \(fpc.backdropView.frame)")
        fpc.backdropView.dismissalTapGestureRecognizer.isEnabled = true
        fpc.show()
    }
    
    
    func configureCLLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        locationManager?.requestWhenInUseAuthorization()
        
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        // 아이폰 설정에서의 위치 서비스가 켜진 상태라면
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager?.startUpdatingLocation() //위치 정보 받아오기 시작
            print("CLLocation: \(locationManager?.location?.coordinate)")
        } else {
            print("위치 서비스 Off 상태")
        }
        
    }
    func floatingPanelDidChangeState(_ fpc: FloatingPanelController) {
        delegate?.updateSearchBar(fpc.state)
    }
    
    func floatingPanelWillBeginDragging(_ fpc: FloatingPanelController) {
        if fpc.state == .full  {
            print("DEBUG : state is full")
        }
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

//MARK: - MTMapViewDelegate
extension MapController:MTMapViewDelegate {
    
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
        //위치 업데이트시
            let currentLocation = location?.mapPointGeo()
            if let latitude = currentLocation?.latitude, let longitude = currentLocation?.longitude{
                print("MTMapView updateCurrentLocation (\(latitude),\(longitude)) accuracy (\(accuracy))")
            }
        }
        
        func mapView(_ mapView: MTMapView?, updateDeviceHeading headingAngle: MTMapRotationAngle) {
            print("MTMapView updateDeviceHeading (\(headingAngle)) degrees")
        }
}

//MARK: - CLLocationManagerDelegate
extension MapController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did update Location")
        
        guard let location = locations.first else { return }
        
        let latitude = location.coordinate.longitude
        let logitude = location.coordinate.longitude
        
        print("위도 : \(latitude), 경도 : \(logitude)")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription.description)
    }
}
