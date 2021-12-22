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
        switch viewModel.state {
        case .ready:
            
            break;
        case .error:

            break;
        case .loading:
            self.contentView.signUpButton.isHidden = true
            self.contentView.activityIndicator.startAnimating()
            break;
        case .idle:
            
            break;
        }
        
        if viewModel.state != .loading {
            self.contentView.signUpButton.isHidden = false
            self.contentView.activityIndicator.stopAnimating()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.viewModel = RegisterViewModel(delegate: self, authService: FirebaseAuthService(), credentialValidationService: OnlyLowercaseCredentialValidationService())
        
        if let viewModel = self.viewModel {
            self.updateState(viewModel)
        }
        
    }
    
    override func loadView() {
        let view = RegisterView { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.didTapSignUpButton()
        } didAlreadyHaveAccountButtonHandler: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.popViewController(animated: true)
        }

        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view = view
    }
    
    var contentView: RegisterView {
        return view as! RegisterView
    }
}
