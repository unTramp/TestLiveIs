//
//  SetMapLocationViewController.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 14.09.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import UIKit
import GoogleMaps

class SetMapLocationViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var locationManager = CLLocationManager()
    
    private var marker = GMSMarker() {
        didSet{
            self.update?(marker)
        }
    }
    
    private var update: ((GMSMarker) -> Void)?
    
    func registerListener(update: @escaping (GMSMarker)-> Void) {
        self.update = update
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.delegate = nil
        self.locationManager.stopUpdatingLocation()
        guard let location = locations.last else { return }
        let lat = location.coordinate.latitude
        let long = location.coordinate.longitude
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 15.0)
        self.myMapView.animate(to: camera)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while getting location \(error)")
    }
    
    let myMapView: GMSMapView = {
        let v = GMSMapView(.blackwhite)
        return v
    }()
    
    let popUpView: UIView = {
        let v = UIView()
        v.backgroundColor = .orange
        return v
    }()
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.marker = GMSMarker(position: coordinate)
        let customMarkerView = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        self.marker.iconView = customMarkerView
        self.myMapView.clear()
        self.marker.map = self.myMapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.setupViews()
        self.setupConstraints()
        self.myMapView.delegate = self
        self.myMapView.isMyLocationEnabled = true
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.startMonitoringSignificantLocationChanges()
        
        self.view.addSubview(self.popUpView)
        self.popUpView .snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(400)
            make.top.equalTo(self.view.snp.bottom).inset(200)
        }
    }
    
    private func setupViews() {
        self.setupMapView()
    }
    
    private func setupConstraints() {
        self.setupMapViewConstraints()
    }
    
    private func setupMapView() {
        self.view.addSubview(self.myMapView)
    }
    
    private func setupMapViewConstraints() {
        self.myMapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
