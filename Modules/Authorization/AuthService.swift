//
//  AuthService.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 12.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation

protocol AuthService {
    
    func signIn(login: String, password: String, completion: @escaping (User?, Error?) -> Void)
    func signUp(login: String, password: String, completion: @escaping (User?, Error?) -> Void)
}
