//
//  MainViewModel.swift
//  googlMapTutuorial2
//
//  Created by Andrey Dorofeev on 17/06/2020.
//  Copyright © 2020 akhil. All rights reserved.
//

import Foundation
import GoogleMaps

class MainViewModel {
    private var markers = [GMSMarker]()
    
    func getMarkers() -> [GMSMarker] {
        return self.markers
    }
    
    func addMarkers(_ markers: [GMSMarker]) {
        self.markers = markers
    }
    
    func getMarkerById(_ uiid: String, completion: @escaping (String) -> Void) {
        var uid = ""
        markers.forEach { marker in
            if marker.userData as! String == uiid {
                uid = uiid
                print(marker.position)
            }
        }
        completion(uid)
    }
    
    
}
