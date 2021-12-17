//
//  AuthViewModel.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 12.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation

enum AuthState {
    case idle
    case loading
    case ready
    case error
}

protocol AuthViewModelDelegate: AnyObject {
    
    func didUpdateState()
    func didShowAlert(title: String, message: String)
    
}

class AuthViewModel {
    
    private var authService: AuthService
    private let credentialValidationService: CredentialValidationService
    
    var state: AuthState = .idle {
        didSet {
            self.delegate?.didUpdateState()
        }
    }
    
    private weak var delegate: AuthViewModelDelegate?
    
    private(set) var login: String? = "A@gmail.com"
    private(set) var password: String? = "Qwerty"
    
    init(delegate: AuthViewModelDelegate, authService: AuthService, credentialValidationService: CredentialValidationService) {
        self.delegate = delegate
        self.authService = authService
        self.credentialValidationService = credentialValidationService
    }
    
    func didTapAuthButton() {
        print("authButtonTapped")
        
        if let login = self.login, let password = self.password {
            
            self.state = .loading
            
            self.authService.signIn(login: login, password: password) { [weak self] user, hasError in
                guard let strongSelf = self else { return }
                if let user = user {
                    print("popViewController")
                    strongSelf.state = .ready
                } else {
                    print("show alert")
                    strongSelf.state = .error
                    strongSelf.delegate?.didShowAlert(title: "Error", message: "Please try again later.")
                }
            }
        }
    }
    
    func didTapRegistrationButton() {
        if let login = self.login, let password = self.password {
            self.authService.signUp(login: login, password: password) { [weak self] user, hasError in
                guard let strongSelf = self else { return }
                if let user = user {
                    print(user.id)
                    strongSelf.state = .ready
                } else {
                    print("show alert")
                    strongSelf.state = .error
                    strongSelf.delegate?.didShowAlert(title: "Error", message: "Not available in your country")
                }
            }
        }
    }
    
    func didUpdateLogin(_ login: String) -> Bool {
        print(login)
        
        let isValid = self.credentialValidationService.isValid(login: login)
        
        if isValid {
            self.login = login
        }
        
        return isValid
    }
    
    func didUpdatePassword(_ password: String) -> Bool {
        print(password)
        
        self.password = password
        
        return true
    }
    
}
