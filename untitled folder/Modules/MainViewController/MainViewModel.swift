//
//  MainViewModel.swift
//  googlMapTutuorial2
//
//  Created by Andrey Dorofeev on 17/06/2020.
//  Copyright © 2020 akhil. All rights reserved.
//

import Foundation
import GoogleMaps

class MainViewModel: IMainViewModel {
    
    private var router: MapViewController?
    private var markerService: IMarkerService?
    private lazy var markers = [GMSMarker]()
    
    init(with markerService: IMarkerService, router: MapViewController) {
        self.markerService = markerService
        self.router = router
        self.loadFBMarkers()
    }
    
    private func loadFBMarkers() {
        guard let markerService = self.markerService else { return }
        markerService.loadFBMarkers(completion: { [weak self] markers in
            guard let strongSelf = self else { return }
            strongSelf.markers = markers
            strongSelf.showMarkers()
        })
    }
    
    func showMarkers() {
        guard let router = self.router else { return }
        router.showMarkers()
    }
    
    func getMarkers() -> [GMSMarker] {
        return self.markers
    }
    
    func getMarkerById(_ uiid: String, completion: @escaping (GMSMarker) -> Void) {
        let id = uiid
        var m: GMSMarker?
        markers.forEach { marker in
            if marker.userData as! String == id {
                m = marker
            }
        }
        guard let marker = m else { return }
        completion(marker)
    }
    
    func didTapMarker() {
        print("marker did tap")
    }
}
