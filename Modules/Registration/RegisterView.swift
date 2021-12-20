//
//  RegisterView.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 20.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import UIKit

class RegisterView: View {
    
    private lazy var signInLabel :  UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.text = "Sign Up"
        v.font = UIFont(name:"Rubik-Medium", size: 32.0)
        return v
    }()
    
    private lazy var followUpEmailLabel :  UILabel = {
        let v = UILabel()
        v.textColor = .customBlue
        v.text = "We will send a follow-up email to confirm if you are an artist."
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.backgroundColor = UIColor.systemGray6
        v.lineBreakMode = .byWordWrapping
        v.numberOfLines = 0
        return v
    }()
    
    lazy var userNameTextField: TextFieldWithPadding = {
        let v = TextFieldWithPadding()
        v.attributedPlaceholder = NSAttributedString(string: "Username",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        v.layer.cornerRadius = 8
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    lazy var emailTextField: TextFieldWithPadding = {
        let v = TextFieldWithPadding()
        v.attributedPlaceholder = NSAttributedString(string: "Email",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        v.layer.cornerRadius = 8
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    lazy var passwordTextField: TextFieldWithPadding = {
        let v = TextFieldWithPadding()
        v.attributedPlaceholder = NSAttributedString(string: "Password",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        v.layer.cornerRadius = 8
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    lazy var confirmPasswordTextField: TextFieldWithPadding = {
        let v = TextFieldWithPadding()
        v.attributedPlaceholder = NSAttributedString(string: "Confirm Password",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        v.layer.cornerRadius = 8
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.layer.borderColor = UIColor.customWhite.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    lazy var registrationButton: UIButton = {
        let v = UIButton()
        v.backgroundColor = .customBlue
        v.layer.cornerRadius = 24
        v.titleLabel?.font =  UIFont(name: "Rubik-Medium", size: 14)
        v.setTitle("Sign Up", for: .normal)
        v.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        return v
    }()
    
    private var didTapRegisterButtonHandler: (() -> Void)?
    
    @objc private func registrationButtonTapped() {
        self.didTapRegisterButtonHandler?()
    }
    
    private lazy var signUpWithLabel :  UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .customLightGray
        v.text = "or sign up with"
        v.textAlignment = .center
        v.font = UIFont(name:"Rubik-Regular", size: 12.0)
        return v
    }()
    
    private lazy var leftLineSignUpWith: UIView = {
        let v = UIView()
        v.backgroundColor = .customWhite
        return v
    }()
    
    private lazy var rightLineSignUpWith: UIView = {
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
    
    private lazy var alreadyHaveAccountLabel :  UILabel = {
        let v = UILabel()
        v.textColor = .customBlue
        v.text = "Already have an account, login here"
        v.font = UIFont(name:"Rubik-Regular", size: 14.00)
        v.textAlignment = .center
        return v
    }()
    
    override func setupViews() {
        self.addSubview(self.signInLabel)
        self.addSubview(self.followUpEmailLabel)
        self.addSubview(self.userNameTextField)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.confirmPasswordTextField)
        self.addSubview(self.registrationButton)
        self.addSubview(self.signUpWithLabel)
        self.addSubview(self.leftLineSignUpWith)
        self.addSubview(self.rightLineSignUpWith)
        self.addSubview(self.signWithGoogleLogoView)
        self.addSubview(self.signWithAppleLogoView)
        self.addSubview(self.signWithFacebookLogoView)
        self.signWithGoogleLogoView.addSubview(self.google_logo)
        self.signWithAppleLogoView.addSubview(self.apple_logo)
        self.signWithFacebookLogoView.addSubview(self.facebook_logo)
        self.addSubview(self.alreadyHaveAccountLabel)
    }
    
    override func setupConstraints() {
        self.signInLabelConstraints()
        self.followUpEmailLabelConstraints()
        self.userNameTextFieldConstraints()
        self.emailTextFieldConstraints()
        self.passwordTextFieldConstraints()
        self.confirmPasswordTextFieldConstraints()
        self.registrationButtonConstraints()
        self.signUpWithLabelConstraints()
        self.leftLineSignUpWithConstraints()
        self.rightLineSignUpWithConstraints()
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
            make.trailing.equalToSuperview()
        }
    }
    
    private func followUpEmailLabelConstraints() {
        self.followUpEmailLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.userNameTextField.snp.top).offset(-32)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(52)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func userNameTextFieldConstraints() {
        self.userNameTextField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(250)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func emailTextFieldConstraints() {
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(self.userNameTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func passwordTextFieldConstraints() {
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.emailTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func confirmPasswordTextFieldConstraints() {
        self.confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(24)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func registrationButtonConstraints() {
        self.registrationButton.snp.makeConstraints { make in
            make.top.equalTo(self.confirmPasswordTextField.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func signUpWithLabelConstraints() {
        self.signUpWithLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.signWithGoogleLogoView.snp.top).offset(-24)
            make.height.equalTo(12)
            make.width.equalTo(130)
        }
    }
    
    private func leftLineSignUpWithConstraints() {
        self.leftLineSignUpWith.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().inset(34)
            make.trailing.equalTo(self.signUpWithLabel.snp.leading)
            make.centerY.equalTo(self.signUpWithLabel.snp.centerY)
        }
    }
    
    private func rightLineSignUpWithConstraints() {
        self.rightLineSignUpWith.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.trailing.equalToSuperview().inset(34)
            make.leading.equalTo(self.signUpWithLabel.snp.trailing)
            make.centerY.equalTo(self.signUpWithLabel.snp.centerY)
        }
    }
    
    private func signWithGoogleLogoViewConstraints() {
        self.signWithGoogleLogoView.snp.makeConstraints { make in
            make.bottom.equalTo(self.alreadyHaveAccountLabel.snp.top).offset(-32)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.width.equalTo(96)
        }
    }
    
    private func signWithAppleLogoViewConstraints() {
        self.signWithAppleLogoView.snp.makeConstraints { make in
            make.bottom.equalTo(self.alreadyHaveAccountLabel.snp.top).offset(-32)
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(96)
        }
    }
    
    private func signWithFacebookLogoViewConstraints() {
        self.signWithFacebookLogoView.snp.makeConstraints { make in
            make.bottom.equalTo(self.alreadyHaveAccountLabel.snp.top).offset(-32)
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
        self.alreadyHaveAccountLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(42)
        }
    }
}
