//
//  AuthView.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 13.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import UIKit

class AuthView: View {
    
    private lazy var signInLabel :  UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.text = "Sign In"
        v.font = UIFont(name:"Rubik-Medium", size: 32.0)
        return v
    }()
    
    private lazy var bgImageView: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "sax2")
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    lazy var loginTextField: TextFieldWithPadding = {
        let v = TextFieldWithPadding()
        v.attributedPlaceholder = NSAttributedString(string: "Enter e-mail",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        v.layer.cornerRadius = 8
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        v.placeholder = "Enter your e-mail"
        return v
    }()
    
    lazy var passwordTextField: TextFieldWithPadding = {
        let v = TextFieldWithPadding()
        v.attributedPlaceholder = NSAttributedString(string: "Enter password",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        v.layer.cornerRadius = 8
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.textColor = .black
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        v.placeholder = "Enter your password"
        v.isSecureTextEntry = true
        return v
    }()
    
    lazy var authorizationButton: UIButton = {
        let v = ButtonFactory.signInButton
        v.addTarget(self, action: #selector(authorizationButtonTapped), for: .touchUpInside)
        return v
    }()
    
    private var didTapAuthButtonHandler: (() -> Void)?
    
    @objc private func authorizationButtonTapped() {
        self.didTapAuthButtonHandler?()
    }
    
    private var didTapCreateAccountButtonHandler: (() -> Void)?
    
    @objc private func createAccountButtonTapped() {
        self.didTapCreateAccountButtonHandler?()
    }
    
    private lazy var authOptionsView: AuthOptionsView = {
        let v = AuthOptionsView(with: "or continue with")
        return v
    }()
    
    lazy var createAccountButton: UIButton = {
        let v = UIButton()
        v.clipsToBounds = true
        v.setTitle("Don’t have an account, create one", for: .normal)
        v.titleLabel?.font = UIFont(name:"Rubik-Regular", size: 14.00)
        v.setTitleColor(.customBlue, for: .normal)
        v.setTitleColor(.lightGray, for: .highlighted)
        v.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        return v
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView ()
        
        return v
    }()
    
    convenience init(didTapAuthButtonHandler: @escaping (() -> Void), didTapCreateAccountButtonHandler: @escaping (() -> Void)) {
        self.init()
        self.didTapAuthButtonHandler = didTapAuthButtonHandler
        self.didTapCreateAccountButtonHandler = didTapCreateAccountButtonHandler
    }
    
    override func setupViews() {
        self.addSubview(self.signInLabel)
        self.addSubview(self.bgImageView)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.authorizationButton)
        self.addSubview(self.authOptionsView)
        self.addSubview(self.createAccountButton)
        self.addSubview(self.activityIndicator)
    }
    
    override func setupConstraints() {
        self.signInLabelConstraints()
        self.bgImageViewConstraints()
        self.loginTextFieldConstraints()
        self.passwordTextFieldConstraints()
        self.authorizationButtonConstraints()
        self.activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(self.authorizationButton)
        }
        self.authOptionsViewConstraints()
        self.createAccountButtonConstraints()
    }
    
    private func signInLabelConstraints() {
        self.signInLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(78)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(38)
            make.trailing.equalTo(bgImageView.snp.leading)
        }
    }
    
    private func bgImageViewConstraints() {
        self.bgImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-90)
            make.centerX.equalToSuperview().offset(110)
            make.bottom.equalTo(self.loginTextField.snp.top)
        }
    }
    
    private func loginTextFieldConstraints() {
        self.loginTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func passwordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.loginTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func authorizationButtonConstraints() {
        self.authorizationButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(57)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func authOptionsViewConstraints() {
        self.authOptionsView.snp.makeConstraints { make in
            make.height.equalTo(108)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(self.authorizationButton.snp.bottom).offset(32)
        }
    }
    
    private func createAccountButtonConstraints() {
        self.createAccountButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.trailing.equalToSuperview()
            make.height.equalTo(17)
            make.leading.equalToSuperview()
        }
    }
}
