//
//  MarkerService.swift
//  googlMapTutuorial2
//
//  Created by Андрей Дорофеев on 29.08.2021.
//  Copyright © 2021 akhil. All rights reserved.
//

import Foundation
import GoogleMaps
import Firebase

class MarkerService: IMarkerService {
    
    static var shared = MarkerService()
    
    private let customMarkerView = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
    
    private var markers = [GMSMarker]()
    
    func loadFBMarkers(completion: @escaping ([GMSMarker]) -> Void) {
        DispatchQueue.main.async {
            let db = Firestore.firestore()
            db.collection("users").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if self.markers.count == 0 {
                        for document in querySnapshot!.documents {
                            let docRef = db.collection("markers").document("\(document.documentID)")
                            docRef.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    let marker = GMSMarker()
                                    marker.iconView = self.customMarkerView
                                    let latitude = document.get("latitude")
                                    let longitude = document.get("longitude")
                                    let id = document.get("id")
                                    let lat = Double(latitude as! Substring) ?? 0.0
                                    let long = Double(longitude as! Substring) ?? 0.0
                                    marker.position.latitude = CLLocationDegrees(lat)
                                    marker.position.longitude = CLLocationDegrees(long)
                                    marker.userData = id
                                    self.markers.append(marker)
                                    print("Loaded, \(String(describing: id))")
                                    completion(self.markers)
                                } else {
                                    print("Document does not exist")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
