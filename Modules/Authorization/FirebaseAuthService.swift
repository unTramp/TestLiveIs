//
//  FirebaseAuthService.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 12.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class FirebaseAuthService: AuthService {
    
    let fb = Firestore.firestore()
    
    let date = Date()
    private lazy var formate = self.date.getFormattedDate(format: "yyyy-MM-dd HH:mm:ss")
    
    func signIn(login: String, password: String, completion: @escaping (User?, Bool) -> Void) {
        
        Auth.auth().signIn(withEmail: login.lowercased(), password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error != nil {
                print("\(error!.localizedDescription)")
                completion(nil, true)
            } else {
                guard let result = authResult else { return }
                let userID = result.user.uid
                let userEmail = result.user.email ?? "default email"
                let userDate = strongSelf.formate
                completion(User(id: userID, email: userEmail, date: userDate), false)
            }
        }
    }
    
    func signUp(login: String, password: String, completion: @escaping (User?, Bool) -> Void) {
        
        Auth.auth().createUser(withEmail: login.lowercased(), password: password) { [weak self] loginResult, error in
            guard let strongSelf = self else { return }
            if error != nil {
                completion(nil, true)
                print("\(error!.localizedDescription)")
                completion(nil, true)
            } else {
                guard let result = loginResult else { return }
                let userID = result.user.uid
                let userEmail = result.user.email ?? "default email"
                let userDate = strongSelf.formate
                strongSelf.fb.collection("users").document(userID).setData(
                    ["email": userEmail,
                    "id": userID,
                    "date": userDate]
                ) { (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                }
                // MARK: Create marker
                                // dry
                let rndLat = Int(arc4random_uniform(99))
                let rndLong = Int(arc4random_uniform(99))

                strongSelf.fb.collection("markers").document(userID).setData([
                    "latitude": "55.67\(rndLat)09",
                    "longitude": "37.62\(rndLong)00",
                    "id": userID,
                ]){ (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                }
                completion(User(id: userID, email: userEmail, date: userDate), false)
            }
        }
    }
}
