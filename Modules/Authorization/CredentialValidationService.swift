//
//  CredentialValidationService.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 12.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation

protocol CredentialValidationService: AnyObject {
    
    func isValid(login: String) -> Bool
    
}
