//
//  AuthViewController.swift
//  googlMapTutuorial2
//
//  Created by Andrey Dorofeev on 13.01.2021.
//  Copyright © 2021 akhil. All rights reserved.
//

import UIKit
import Foundation
import SnapKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController, UITextFieldDelegate, AuthViewModelDelegate {
    
    func moveTo(_ route: AuthViewModelRoute) {
        switch route {
        case .close:
            self.navigationController?.popViewController(animated: true)
            break;
        case .showRegister:
            self.showRegisterViewController()
            break;
        }
    }
    
    let storage = Storage.storage()
    
    private var authService: AuthService = FirebaseAuthService()
    private var viewModel: AuthViewModel?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.contentView.loginTextField {
            
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                    return self.viewModel?.didUpdateLogin(updatedText) ?? true
                }
        } else if textField == self.contentView.passwordTextField {
            
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                return self.viewModel?.didUpdatePassword(updatedText) ?? true
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("resign first responder")
        textField.resignFirstResponder()
        return true
    }
    
    private func showRegisterViewController() {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.viewModel = AuthViewModel(delegate: self, authService: FirebaseAuthService(), credentialValidationService: OnlyLowercaseCredentialValidationService())
        if let viewModel = self.viewModel {
            self.contentView.loginTextField.text = viewModel.login
            self.contentView.loginTextField.delegate = self
            self.contentView.passwordTextField.delegate = self
            self.updateState(viewModel)
        }
    }
    
    override func loadView() {
        let view = AuthView(didTapAuthButtonHandler: { [weak self] in
            
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.didTapAuthButton()
        }, didTapRegisterButtonHandler: { [weak self] in
            
            guard let strongSelf = self else { return }
            strongSelf.viewModel?.didTapRegistrationButton()
        })
        
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view = view
    }
    
        var contentView: AuthView {
        return view as! AuthView
    }
    
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
    
    func delay(delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }

    private func updateState(_ viewModel: AuthViewModel) {
        
        switch viewModel.state {
        case .ready:
            
            break;
        case .error:

            break;
            
        default:
            break;
        }
        
        if viewModel.state == .loading {
            self.contentView.authorizationButton.isHidden = true
            self.contentView.activityIndicator.startAnimating()
        } else {
            self.contentView.authorizationButton.isHidden = false
            self.contentView.activityIndicator.stopAnimating()
        }
    }
}
