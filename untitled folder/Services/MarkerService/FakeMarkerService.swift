//
//  FakeMarkerService.swift
//  LiveIs
//
//  Created by Andrey Dorofeev on 9/9/21.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces

class FakeMarkerService: IMarkerService {
    
    static var shared = FakeMarkerService()
    
    private let customMarkerView = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
    
    private var markers = [GMSMarker]()
    
    func loadFBMarkers(completion: @escaping ([GMSMarker]) -> Void) {
        let marker = GMSMarker()
        marker.iconView = self.customMarkerView
        let latitude = 37.78553400
        let longitude = -122.40541700
        let id = "custom marker"
        marker.position.latitude = CLLocationDegrees(latitude)
        marker.position.longitude = CLLocationDegrees(longitude)
        marker.userData = id
        self.markers.append(marker)
        completion(self.markers)
    }
    
    
}
