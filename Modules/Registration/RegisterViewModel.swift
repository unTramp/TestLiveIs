//
//  RegisterViewModel.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 20.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation

enum RegisterState {
    case idle
    case loading
    case ready
    case error
}

enum RegisterViewModelRoute {
    case close
    case showRoot
}

protocol RegisterViewModelDelegate: AnyObject {
    
    func didUpdateState()
    func didShowAlert(title: String, message: String)
    func moveTo(_ route: RegisterViewModelRoute)
    
}

class RegisterViewModel {
    
    private var authService: AuthService
    private let credentialValidationService: CredentialValidationService
    
    var state: AuthState = .idle {
        didSet {
            self.delegate?.didUpdateState()
        }
    }
    
    private weak var delegate: RegisterViewModelDelegate?
    
    init(delegate: RegisterViewModelDelegate, authService: AuthService, credentialValidationService: CredentialValidationService) {
        self.delegate = delegate
        self.authService = authService
        self.credentialValidationService = credentialValidationService
    }
    
    func didTapSignUpButton() {
        print("Sign Up")
    }
    
}
