//
//  PasswordConfirmationServiceImpl.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 25.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation

class PasswordConfirmationServiceImpl: PasswordConfirmationService {
    
    func isConfirm(password: String, confirmedPassword: String) -> Bool {
        print("password: \(password), confirmed \(confirmedPassword)")
        return password == confirmedPassword
    }
}
