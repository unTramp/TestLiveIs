//
//  IMarkerService.swift
//  googlMapTutuorial2
//
//  Created by Андрей Дорофеев on 29.08.2021.
//  Copyright © 2021 akhil. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces

protocol IMarkerService {
    func loadFBMarkers(completion: @escaping ([GMSMarker]) -> Void)
}
