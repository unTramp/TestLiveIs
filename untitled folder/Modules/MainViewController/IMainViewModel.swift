//
//  IMainViewModel.swift
//  LiveIs
//
//  Created by Andrey Dorofeev on 12/8/21.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import GoogleMaps

protocol IMainViewModel {
    func getMarkers() -> [GMSMarker]
    func getMarkerById(_ uiid: String, completion: @escaping (GMSMarker) -> Void)
    func didTapMarker()
}
