//
//  MapViewController.swift
//  googlMapTutuorial2
//
//  Created by Muskan on 12/17/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import SnapKit
import AVFoundation
import FirebaseAuth
import Firebase

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    private var mainViewModel: IMainViewModel?
    private var markerService: IMarkerService?
    private lazy var fb = Firestore.firestore()
    private lazy var currentLocationMarker = GMSMarker()
    private lazy var locationManager = CLLocationManager()
    private lazy var isBottomMenuPresented = false
    private lazy var isShown = false
    private lazy var isStatic = false
    private lazy var bottomMenuBasicPosition: CGFloat = self.view.bounds.height
    
    private lazy var customInfoWindow: EventPreviewView = {
        let v = EventPreviewView()
        v.playButtonTappedCompletion = {
            self.eventTapped()
        }
        return v
    }()
    
    private lazy var liveMusicLabel :  UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.text = "Nearest Live Music"
        v.font = UIFont(name:"Rubik-Medium", size: 32.0)
        return v
    }()
    
    private lazy var myFavoriteButton :  UIButton = {
        let v = ButtonFactory.favorite
        v.addTarget(self, action: #selector(favoriteButtonTap), for: .touchUpInside)
        return v
    }()
    
    private lazy var joinArtistButton : UIButton = {
        let v = ButtonFactory.artist
        v.addTarget(self, action: #selector(joinArtistButtonTap), for: .touchUpInside)
        return v
    }()
    
    private lazy var myEventsButton : UIButton = {
        let v = ButtonFactory.event
        v.addTarget(self, action: #selector(myEventsButtonTap), for: .touchUpInside)
        v.isHidden = true
        return v
    }()
    
    private lazy var bottomMenu: PopUpView = {
        let v = PopUpView()
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        swipeDown.direction = .down
        v.addGestureRecognizer(swipeUp)
        v.addGestureRecognizer(swipeDown)
        v.addEventButton.addTarget(self, action: #selector(addEventButtonTap), for: .touchUpInside)
       return v
    }()
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer){
        self.bottomMenuShowButtonTapped()
    }
    
    private lazy var myMapView: GMSMapView = {
        let v = GMSMapView(.blackwhite)
        return v
    }()
    
    private lazy var btnMyLocation: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "my_location"), for: .normal)
        v.layer.cornerRadius = 22
        v.clipsToBounds=true
        v.addTarget(self, action: #selector(btnMyLocationAction), for: .touchUpInside)
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    // MARK: CLLocation Manager Delegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while getting location \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.delegate = nil
        self.locationManager.stopUpdatingLocation()
        let location = locations.last
        let lat = (location?.coordinate.latitude)!
        let long = (location?.coordinate.longitude)!
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 17.0)
        self.myMapView.animate(to: camera)
    }
    
    // MARK: GOOGLE MAP DELEGATE
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let viewModel = self.mainViewModel else { return false }
        viewModel.didTapMarker()
        
        let position = marker.position
        self.myMapView.animate(toLocation: position)
        let point = self.myMapView.projection.point(for: position)
        let newPoint = self.myMapView.projection.coordinate(for: point)
        let camera = GMSCameraUpdate.setTarget(newPoint)
        self.myMapView.animate(with: camera)
        
        if isShown == false && isStatic == true && self.currentLocationMarker.userData as! String == marker.userData as! String {
            self.showCustomInfoWindow()
            isShown = true
        }
        
        self.currentLocationMarker = marker
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        if isShown == true {
            self.customInfoWindow.removeFromSuperview()
            self.customInfoWindow.snp.removeConstraints()
            isShown = false
        }
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        if Float(currentLocationMarker.position.latitude) == Float(position.target.latitude) &&
            Float(currentLocationMarker.position.longitude) == Float(position.target.longitude) {
            self.showCustomInfoWindow()
            isShown = true
            isStatic = true
        }
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        if isShown != false && isStatic != false {
            self.customInfoWindow.removeFromSuperview()
            self.customInfoWindow.snp.removeConstraints()
            isShown = false
            isStatic = false
        }
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        return UIView()
    }
    
    func showCustomInfoWindow() {
        let position = currentLocationMarker.position
        let point = self.myMapView.projection.point(for: position)
        self.myMapView.addSubview(self.customInfoWindow)
        
        self.customInfoWindow.snp.remakeConstraints { make in
            make.width.equalTo(280)
            make.height.equalTo(72)
            make.centerX.equalTo(point.x)
            make.centerY.equalTo(point.y - 60)
        }
    }
    
    @objc func bottomMenuShowButtonTapped() {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseOut) {
            self.bottomMenu.frame.origin.y = self.bottomChangePosition(self.isBottomMenuPresented)
        } completion: { (finished) in
            self.isBottomMenuPresented.toggle()
        }
    }
    
    func bottomChangePosition(_ isUp: Bool) -> CGFloat {
        return isUp ? self.bottomMenuBasicPosition - 200 : self.bottomMenuBasicPosition - 360
    }
    
    func showMarkers() {
        guard let viewModel = self.mainViewModel else { return }
        let markers = viewModel.getMarkers()
        
        self.myMapView.clear()
        
        DispatchQueue.main.async {
            for marker in markers {
                marker.appearAnimation = .pop
                marker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
                marker.map = self.myMapView
            }
        }
    }
    
    @objc func btnMyLocationAction() {
        let location: CLLocation? = myMapView.myLocation
        if location != nil {
            self.myMapView.animate(toLocation: (location?.coordinate)!)
        }
    }
    
    @objc func eventTapped() {
        AudioServicesPlayAlertSound(SystemSoundID(1330))
        self.customInfoWindow.runProgress()
    }
    
    @objc func favoriteButtonTap() {
    }
    
    @objc func joinArtistButtonTap() {
        self.joinArtistButton.isHidden = true
        self.myEventsButton.isHidden = false
        let toVC = ViewControllerService.shared.getViwController(.auth)
        self.navigationController?.pushViewController(toVC, animated: true)
    }
    
    @objc func myEventsButtonTap () {
        self.myEventsButton.isHidden = true
        self.joinArtistButton.isHidden = false
    }
    
    @objc func addEventButtonTap() {
        let toVC = ViewControllerService.shared.getViwController(.create) as! CreateEventViewController
        self.navigationController?.pushViewController(toVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.markerService = MarkerService.shared
        guard let markerService = self.markerService else {  return  }
        self.mainViewModel = MainViewModel(with: markerService, router: self)
        
        self.initGoogleMaps()
        self.setupBasics()
        self.setupViews()
        self.setupConstraints()
    }
    
    private func initGoogleMaps() {
        let camera = GMSCameraPosition.camera(withLatitude: 55.674389, longitude: 37.628440, zoom: 15.0)
        self.myMapView.camera = camera
        self.myMapView.delegate = self
        self.myMapView.isMyLocationEnabled = true
        self.showMarkers()
    }
    
    private func setupBasics() {
        self.view.backgroundColor = UIColor.white
        self.myMapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.startMonitoringSignificantLocationChanges()
        
        guard let naviController = self.navigationController else { return }
        naviController.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViews() {
        self.view.addSubview(self.myMapView)
        self.view.addSubview(self.btnMyLocation)
        self.view.addSubview(self.bottomMenu)
        self.view.addSubview(self.liveMusicLabel)
        self.view.addSubview(self.myFavoriteButton)
        self.view.addSubview(self.joinArtistButton)
        self.view.addSubview(self.myEventsButton)
    }
    
    private func setupConstraints() {
        self.liveMusicLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(84)
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(24)
            make.trailing.equalToSuperview()
        }

        self.myFavoriteButton.snp.makeConstraints { make in
            make.top.equalTo(self.liveMusicLabel.snp.bottom).offset(24)
            make.height.equalTo(32)
            make.leading.equalTo(self.liveMusicLabel.snp.leading)
            make.width.equalTo(122)
        }
        
        self.joinArtistButton.snp.makeConstraints { make in
            make.top.equalTo(myFavoriteButton.snp.top)
            make.height.equalTo(myFavoriteButton.snp.height)
            make.leading.equalTo(self.myFavoriteButton.snp.trailing).offset(8)
            make.width.equalTo(126)
        }
        
        self.myEventsButton.snp.makeConstraints { make in
            make.top.equalTo(myFavoriteButton.snp.top)
            make.height.equalTo(myFavoriteButton.snp.height)
            make.leading.equalTo(self.myFavoriteButton.snp.trailing).offset(8)
            make.width.equalTo(112)
        }
        
        self.myMapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.btnMyLocation.snp.makeConstraints { make in
            make.width.equalTo(45)
            make.height.equalTo(45)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(120)
        }
        
        self.bottomMenu.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(400)
            make.top.equalTo(self.view.snp.bottom).inset(200)
        }
    }
}
