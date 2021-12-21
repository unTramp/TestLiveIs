//
//  RegisterViewController.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 18.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewModelDelegate {
    
    private var authService: AuthService = FirebaseAuthService()
    private var viewModel: RegisterViewModel?
    
    func didUpdateState() {
        if let viewModel = self.viewModel {
            self.updateState(viewModel)
        }
    }
    
    func didShowAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        delay(delay: 3) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    func moveTo(_ route: RegisterViewModelRoute) {
        switch route {
        case .close:
            self.dismiss(animated: true, completion: nil)
            break;
        case .showRoot:
            self.navigationController?.popToRootViewController(animated: true)
            break;
        }
    }
    
    func delay(delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    private func updateState(_ viewModel: RegisterViewModel) {
   
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.viewModel = RegisterViewModel(delegate: self, authService: FirebaseAuthService(), credentialValidationService: OnlyLowercaseCredentialValidationService())
        
        if let viewModel = self.viewModel {
            self.updateState(viewModel)
        }
        
        self.contentView.didTapRegisterButtonHandler = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.didTapSignUpButton()
        }
            
    }
    
    override func loadView() {
        let view = RegisterView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view = view
    }
    
    var contentView: RegisterView {
        return view as! RegisterView
    }
}
