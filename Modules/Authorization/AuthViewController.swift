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
    
    let date = Date()
    private lazy var formate = self.date.getFormattedDate(format: "yyyy-MM-dd HH:mm:ss")
    
    let fb = Firestore.firestore()
    let storage = Storage.storage()
    
    private var authService: AuthService = FirebaseAuthService()
    private var viewModel: AuthViewModel?
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.contentView.loginTextField {
            
            if let text = textField.text, let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange, with: string)
                return self.viewModel?.didUpdateLogin(updatedText) ?? true
            }
        }
        
        return true
    }
    
    @objc private func registrationButtonTapped() {
        self.viewModel?.didTapRegistrationButton()
        
        return
        
        
        guard let login = self.contentView.loginTextField.text else { return }
        guard let password = self.contentView.passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: login.lowercased(),
                               password: password) { [weak self] (loginResult, error) in
            
            guard let strongSelf = self else { return }
            
            if error != nil {
                //alert
                print("\(error!.localizedDescription)")
            } else {
                guard let result = loginResult else { return }
                let userID = result.user.uid
                strongSelf.fb.collection("users").document(userID).setData(
                    ["email": strongSelf.contentView.loginTextField.text!.lowercased(),
                    "id": result.user.uid,
                    "date": strongSelf.formate]
                ) { (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                    print("New user cerated: \(result.user.uid)")
                }
                
// MARK: Create marker
                // dry
                let rndLat = Int(arc4random_uniform(99))
                let rndLong = Int(arc4random_uniform(99))
                
                strongSelf.fb.collection("markers").document(userID).setData([
                    "latitude": "55.67\(rndLat)09",
                    "longitude": "37.62\(rndLong)00",
                    "id": userID,
                ]){ (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                }
            }
        }
    }
    
    @objc private func authorizationButtonTapped() {
        self.viewModel?.didTapAuthButton()
    }

    @objc func trippleTap() {
        self.contentView.passwordTextField.text = "Qwerty"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.trippleTap()
        
        self.viewModel = AuthViewModel(delegate: self, authService: FirebaseAuthService(), credentialValidationService: OnlyLowercaseCredentialValidationService())
        if let viewModel = self.viewModel {
            self.contentView.loginTextField.text = viewModel.login
            self.contentView.loginTextField.delegate = self
            self.contentView.passwordTextField.delegate = self
            self.updateState(viewModel)
        }
    }
    
    override func loadView() {
        let view = AuthView(didTapAuthButtonHandler: {
            self.authorizationButtonTapped()
        }, didTapRegisterButtonHandler: {
            self.registrationButtonTapped()
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
    }
    
    private func updateState(_ viewModel: AuthViewModel) {
        
        switch viewModel.state {
        case .ready:
            self.navigationController?.popViewController(animated: true)
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
