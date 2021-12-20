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
        let v = UIButton()
        v.backgroundColor = .customBlue
        v.layer.cornerRadius = 8
        v.titleLabel?.font =  UIFont(name: "Rubik-Medium", size: 14)
        v.setTitle("Sign in", for: .normal)
        v.addTarget(self, action: #selector(authorizationButtonTapped), for: .touchUpInside)
        return v
    }()
    
    private var didTapAuthButtonHandler: (() -> Void)?
    
    @objc private func authorizationButtonTapped() {
        self.didTapAuthButtonHandler?()
    }
    
    lazy var registrationButton: UIButton = {
        let v = UIButton()
        v.backgroundColor = .clear
        v.layer.cornerRadius = 30
        v.titleLabel?.font = UIFont(name:"Rubik-Light", size: 17.0)
        v.setTitleColor(UIColor.white, for: .normal)
        v.setTitle("Registration", for: .normal)
        v.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        return v
    }()
    
    private var didTapRegisterButtonHandler: (() -> Void)?
    
    @objc private func registrationButtonTapped() {
        self.didTapRegisterButtonHandler?()
    }
    
    private lazy var continueWithLabel :  UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .customLightGray
        v.text = "or continue with"
        v.textAlignment = .center
        v.font = UIFont(name:"Rubik-Regular", size: 12.0)
        return v
    }()
    
    private lazy var leftLineContinueWith: UIView = {
        let v = UIView()
        v.backgroundColor = .customWhite
        return v
    }()
    
    private lazy var rightLineContinueWith: UIView = {
        let v = UIView()
        v.backgroundColor = .customWhite
        return v
    }()
    
    private lazy var signWithGoogleLogoView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    private lazy var signWithAppleLogoView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    private lazy var signWithFacebookLogoView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    private lazy var google_logo:  UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "google_logo")
        return v
    }()
    
    private lazy var apple_logo:  UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "apple_logo")
        return v
    }()
    
    private lazy var facebook_logo:  UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "facebook_logo")
        return v
    }()
    
    private lazy var dontHaveAccountLabel :  UILabel = {
        let v = UILabel()
        v.textColor = .customBlue
        v.text = "Don’t have an account, create one"
        v.font = UIFont(name:"Rubik-Regular", size: 14.00)
        v.textAlignment = .center
        return v
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView ()
        
        return v
    }()
    
    convenience init(didTapAuthButtonHandler: @escaping (() -> Void), didTapRegisterButtonHandler: @escaping (() -> Void)) {
        self.init()
        self.didTapAuthButtonHandler = didTapAuthButtonHandler
        self.didTapRegisterButtonHandler = didTapRegisterButtonHandler
    }
    
    override func setupViews() {
        self.addSubview(self.signInLabel)
        self.addSubview(self.bgImageView)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registrationButton)
        self.addSubview(self.authorizationButton)
        self.addSubview(self.activityIndicator)
        self.addSubview(self.continueWithLabel)
        self.addSubview(self.leftLineContinueWith)
        self.addSubview(self.rightLineContinueWith)
        self.addSubview(self.signWithGoogleLogoView)
        self.addSubview(self.signWithAppleLogoView)
        self.addSubview(self.signWithFacebookLogoView)
        self.signWithGoogleLogoView.addSubview(self.google_logo)
        self.signWithAppleLogoView.addSubview(self.apple_logo)
        self.signWithFacebookLogoView.addSubview(self.facebook_logo)
        self.addSubview(self.dontHaveAccountLabel)
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
        self.registrationButtonConstraints()
        self.continueWithLabelConstraints()
        self.leftLineContinueWithConstraints()
        self.rightLineContinueWithConstraints()
        self.signWithGoogleLogoViewConstraints()
        self.signWithAppleLogoViewConstraints()
        self.signWithFacebookLogoViewConstraints()
        self.google_logoConstraints()
        self.apple_logoConstraints()
        self.facebook_logoConstraints()
        self.dontHaveAccountLabelConstraints()
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
    
    private func registrationButtonConstraints() {
        self.registrationButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
    }
    
    private func continueWithLabelConstraints() {
        self.continueWithLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.authorizationButton.snp.bottom).offset(48)
            make.height.equalTo(12)
            make.width.equalTo(130)
        }
    }
    
    private func leftLineContinueWithConstraints() {
        self.leftLineContinueWith.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().inset(34)
            make.trailing.equalTo(self.continueWithLabel.snp.leading)
            make.centerY.equalTo(self.continueWithLabel.snp.centerY)
        }
    }
    
    private func rightLineContinueWithConstraints() {
        self.rightLineContinueWith.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.trailing.equalToSuperview().inset(34)
            make.leading.equalTo(self.continueWithLabel.snp.trailing)
            make.centerY.equalTo(self.continueWithLabel.snp.centerY)
        }
    }
    
    private func signWithGoogleLogoViewConstraints() {
        self.signWithGoogleLogoView.snp.makeConstraints { make in
            make.top.equalTo(self.rightLineContinueWith.snp.bottom).offset(48)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.width.equalTo(96)
        }
    }
    
    private func signWithAppleLogoViewConstraints() {
        self.signWithAppleLogoView.snp.makeConstraints { make in
            make.top.equalTo(self.rightLineContinueWith.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(96)
        }
    }
    
    private func signWithFacebookLogoViewConstraints() {
        self.signWithFacebookLogoView.snp.makeConstraints { make in
            make.top.equalTo(self.rightLineContinueWith.snp.bottom).offset(48)
            make.trailing.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.width.equalTo(96)
        }
    }
    
    private func google_logoConstraints() {
        self.google_logo.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.center.equalToSuperview()
        }
    }
    
    private func apple_logoConstraints() {
        self.apple_logo.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.center.equalToSuperview()
        }
    }
    
    private func facebook_logoConstraints() {
        self.facebook_logo.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.center.equalToSuperview()
        }
    }
    
    private func dontHaveAccountLabelConstraints() {
        self.dontHaveAccountLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(42)
        }
    }
}
