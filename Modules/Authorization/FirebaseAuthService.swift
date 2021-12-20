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
    
    func lastLoginDateCreation() -> String {
        let date = Date()
        return date.getFormattedDate(format: "yyyy-MM-dd HH:mm:ss")
    }
    
    func signIn(login: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        
        Auth.auth().signIn(withEmail: login.lowercased(), password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error != nil {
                completion(nil, error)
            } else {
                guard let result = authResult else { return }
                let userID = result.user.uid
                guard let userEmail = result.user.email else { return }
                let userLastLoginDate = strongSelf.lastLoginDateCreation()
                strongSelf.fb.collection("users").document(userID).updateData(
                    ["date": userLastLoginDate]
                ) { error in
                    if (error) != nil {
                        completion(nil, error)
                    }
                }
                completion(User(id: userID, email: userEmail, lastLoginAt: userLastLoginDate), nil)
            }
        }
    }
    
    func signUp(login: String, password: String, completion: @escaping (User?, Error?) -> Void) {
        
        Auth.auth().createUser(withEmail: login.lowercased(), password: password) { [weak self] loginResult, error in
            guard let strongSelf = self else { return }
            if error != nil {
                completion(nil, error!)
            } else {
                guard let result = loginResult else { return }
                let userID = result.user.uid
                guard let userEmail = result.user.email else { return }
                let userLastLoginDate = strongSelf.lastLoginDateCreation()
                strongSelf.fb.collection("users").document(userID).setData(
                    ["email": userEmail,
                    "id": userID,
                    "date": userLastLoginDate]
                ) { (error) in
                    if error != nil {
                        completion(nil, error)
                    }
                }
                // MARK: Create marker
                
                let rndService = RandomNumberService()
                
                strongSelf.fb.collection("markers").document(userID).setData([
                    "latitude": "55.67\(rndService.nextRandomInt())09",
                    "longitude": "37.62\(rndService.nextRandomInt())00",
                    "id": userID,
                ]){ (error) in
                    if error != nil {
                        completion(nil, error)
                    }
                }
                completion(User(id: userID, email: userEmail, lastLoginAt: userLastLoginDate), nil)
            }
        }
    }
}
