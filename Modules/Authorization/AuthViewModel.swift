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

enum AuthViewModelRoute {
    case close
    case showRegister
}

protocol AuthViewModelDelegate: AnyObject {
    
    func didUpdateState()
    func didShowAlert(title: String, message: String)
    func moveTo(_ route: AuthViewModelRoute)
    
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
                if user != nil {
                    strongSelf.state = .ready
                    strongSelf.delegate?.moveTo(.close)
                } else {
                    strongSelf.state = .error
                    strongSelf.delegate?.didShowAlert(title: "Error", message: hasError.debugDescription)
                }
            }
        }
    }
    
    func didTapCreateAccountButton() {
        self.delegate?.moveTo(.showRegister)
        
//        if let login = self.login, let password = self.password {
//            self.authService.signUp(login: login, password: password) { [weak self] user, hasError in
//                guard let strongSelf = self else { return }
//                if user != nil {
//                    strongSelf.state = .ready
//                    strongSelf.delegate?.moveTo(.showRegister)
//                } else {
//                    strongSelf.state = .error
//                    strongSelf.delegate?.didShowAlert(title: "Error", message: hasError.debugDescription)
//                }
//            }
//        }
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
