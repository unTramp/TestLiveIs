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
    
    var state: RegisterState = .idle {
        didSet {
            self.delegate?.didUpdateState()
        }
    }
    
    private weak var delegate: RegisterViewModelDelegate?
    
    private(set) var login: String? = ""
    private(set) var password: String? = ""
    
    init(delegate: RegisterViewModelDelegate, authService: AuthService, credentialValidationService: CredentialValidationService) {
        self.delegate = delegate
        self.authService = authService
        self.credentialValidationService = credentialValidationService // для пароля нужен другой?
    }
    
    func didTapSignUpButton() {
        self.state = .loading
        
        if let login = self.login, let password = self.password {
            self.authService.signUp(login: login, password: password) { [weak self] user, hasError in
                guard let strongSelf = self else { return }
                if user != nil {
                    strongSelf.state = .ready
                    strongSelf.delegate?.moveTo(.showRoot)
                } else {
                    strongSelf.state = .error
                    strongSelf.delegate?.didShowAlert(title: "Error", message: hasError.debugDescription)
                }
            }
        }
    }
    
    func didTapAlreadyHaveAccountButton() {
        self.delegate?.moveTo(.close)
    }
    
}
