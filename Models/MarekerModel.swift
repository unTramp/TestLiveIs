//
//  MarekerModel.swift
//  googlMapTutuorial2
//
//  Created by Андрей Дорофеев on 29.08.2021.
//  Copyright © 2021 akhil. All rights reserved.
//

import Foundation

class MarkerModel {
    
    var latitude: String!
    var longitude: String!
    var id: String!
    
    init(_ lat: String, long: String, id: String) {
        self.latitude = lat
        self.longitude = long
        self.id = id
    }
}
