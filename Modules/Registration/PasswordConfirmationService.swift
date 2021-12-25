//
//  PasswordConfirmationService.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 25.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation

protocol PasswordConfirmationService: AnyObject {
    
    func isConfirm(password: String, confirmedPassword: String) -> Bool
    
}
