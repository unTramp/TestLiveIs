//
//  MarkerService.swift
//  googlMapTutuorial2
//
//  Created by Andrey Dorofeev on 12/22/20.
//  Copyright © 2020 akhil. All rights reserved.
//

import Foundation
import Firebase

class UserService: IUserService {
    
    static var shared = UserService()
    
    private var users = [UserModel]()
    
    func loadFBUsers(completion: @escaping ([UserModel]) -> Void) {
        DispatchQueue.global().async {
            let db = Firestore.firestore()
            db.collection("users").getDocuments() { [weak self](querySnapshot, err) in
                guard let strongSelf = self else { return }
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    if strongSelf.users.count == 0 {
                        for document in querySnapshot!.documents {
                            let docRef = db.collection("users").document("\(document.documentID)")
                            docRef.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    guard let email = document.get("email") as? String else { return }
                                    guard let id = document.get("id") as? String else { return }
                                    guard let date = document.get("date") as? String else { return }
                                    let userModel = UserModel(email, date: date, id: id)
                                    strongSelf.users.append(userModel)
                                    print("Loaded persons, \(String(describing: strongSelf.users.count))")
                                    completion(strongSelf.users)
                                } else {
                                    print("There are no users registered.")
                                }
                            }
                        }
                    }
                }
            }
        }
        
        
        
//        DispatchQueue.main.async {
//            let db = Firestore.firestore()
//            db.collection("users").getDocuments() { (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//                } else {
//                    if self.markers.count == 0 {
//                        for document in querySnapshot!.documents {
//                            let docRef = db.collection("markers").document("\(document.documentID)")
//                            docRef.getDocument { (document, error) in
//                                if let document = document, document.exists {
//                                    let marker = GMSMarker()
//                                    marker.iconView = self.customMarker
//                                    guard let latitude = Double(document.get("latitude") as! Substring) else { return }
//                                    guard let longitude = Double(document.get("longitude") as! Substring) else { return }
//                                    let id = document.get("id")
//                                    marker.position.latitude = CLLocationDegrees(latitude)
//                                    marker.position.longitude = CLLocationDegrees(longitude)
//                                    marker.userData = id
//                                    self.markers.append(marker)
//                                    print("Loaded, \(String(describing: id))")
//                                    completion(self.markers)
//                                } else {
//                                    print("Document does not exist")
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
    
}
