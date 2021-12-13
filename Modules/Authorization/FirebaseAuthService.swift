//
//  FirebaseAuthService.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 12.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import FirebaseAuth

class FirebaseAuthService: AuthService {
    
    func signIn(login: String, password: String, completion: @escaping (User?, Bool) -> Void) {
        
        Auth.auth().signIn(withEmail: login.lowercased(), password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if error != nil {
                print("\(error!.localizedDescription)")
                completion(nil, true)
            } else {
                guard let result = authResult else { return }
                let userID = result.user.uid
                completion(User(id: userID), false)
            }
        }
    }
}
