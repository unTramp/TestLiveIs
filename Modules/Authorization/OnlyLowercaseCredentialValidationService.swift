//
//  OnlyLowercaseCredentialValidationService.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 12.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation

class OnlyLowercaseCredentialValidationService: CredentialValidationService {
    
    func isValid(login: String) -> Bool {
        return login.elementsEqual(login.lowercased())
    }
    
}
