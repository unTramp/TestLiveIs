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
    
    private lazy var authOptionsView: AuthOptionsView = {
        let v = AuthOptionsView(with: "or sign up with")
        return v
    }()
    
    private lazy var signUpLabel:  UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.text = "Sign Up"
        v.font = UIFont(name:"Rubik-Medium", size: 32.0)
        return v
    }()
    
    private lazy var userArtistContainerView: UIView = {
        let v = UIView()
        return v
    }()
    
    private lazy var userButton: UIButton = {
        let v = UIButton()
        v.clipsToBounds = true
        v.setTitle("User", for: .normal)
        v.setTitleColor(.customBlue, for: .normal)
        v.setTitleColor(.systemGray, for: .highlighted)
        v.titleLabel?.font = .fontRubikSize(17)
        v.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
        return v
    }()
    
    @objc func userButtonTapped() {
        self.artistButton.isUserInteractionEnabled = true
        self.userButton.isUserInteractionEnabled = false
        self.artistButton.isHighlighted = true
        self.confirmMessageContainerRemakeConstraints(true)
        self.comnfirmMessageContainerView.isHidden = true
        self.artistBottomLineView.isHidden = true
        self.userBottomLineView.isHidden = false
    }
    
    private lazy var artistButton: UIButton = {
        let v = UIButton()
        v.clipsToBounds = true
        v.setTitle("Artist", for: .normal)
        v.setTitleColor(.customBlue, for: .normal)
        v.setTitleColor(.systemGray, for: .highlighted)
        v.titleLabel?.font = .fontRubikSize(17)
        v.addTarget(self, action: #selector(artistButtonTapped), for: .touchUpInside)
        return v
    }()
    
    @objc func artistButtonTapped() {
        self.userButton.isUserInteractionEnabled = true
        self.artistButton.isUserInteractionEnabled = false
        self.userButton.isHighlighted = true
        self.confirmMessageContainerRemakeConstraints(false)
        self.comnfirmMessageContainerView.isHidden = false
        self.artistBottomLineView.isHidden = false
        self.userBottomLineView.isHidden = true
    }
    
    private lazy var userBottomLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .customBlue
        return v
    }()
    
    private lazy var artistBottomLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .customBlue
        return v
    }()
    
    private lazy var signUpInfoSymbol: UIButton = {
        let v = UIButton(type: .infoDark)
        v.isUserInteractionEnabled = false
        return v
    }()
    
    private lazy var comnfirmMessageContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.systemGray6
        return v
    }()
    
    private lazy var followUpLabel:  UILabel = {
        let v = UILabel()
        v.textColor = .customBlue
        v.text = "We will send a follow-up email to confirm if you are an artist."
        v.font = UIFont(name:"Rubik", size: 14.0)
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
    
    lazy var signUpButton: UIButton = {
        let v = ButtonFactory.signUpButton
        v.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return v
    }()
    
    var didTapSignUpButtonHandler: (() -> Void)?
    
    @objc private func signUpButtonTapped() {
        self.didTapSignUpButtonHandler?()
    }
    
    lazy var alreadyHaveAccountButton: UIButton = {
        let v = UIButton()
        v.clipsToBounds = true
        v.setTitle("Already have an account, login here", for: .normal)
        v.titleLabel?.font = UIFont(name:"Rubik-Regular", size: 14.00)
        v.setTitleColor(.customBlue, for: .normal)
        v.setTitleColor(.lightGray, for: .highlighted)
        v.addTarget(self, action: #selector(alreadyHaveAccountButtonTapped), for: .touchUpInside)
        return v
    }()
    
    var didAlreadyHaveAccountButtonHandler: (() -> Void)?
    
    @objc private func alreadyHaveAccountButtonTapped() {
        self.didAlreadyHaveAccountButtonHandler?()
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let v = UIActivityIndicatorView ()
        
        return v
    }()
    
    private func confirmMessageContainerRemakeConstraints(_ doRemake: Bool) {
        if doRemake {
            self.comnfirmMessageContainerView.snp.remakeConstraints { make in
                make.height.equalTo(0)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
                make.top.equalTo(self.userBottomLineView.snp.bottom)
            }
        } else {
            self.comnfirmMessageContainerView.snp.remakeConstraints { make in
                make.height.equalTo(64)
                make.top.equalTo(self.userBottomLineView.snp.bottom)
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
            }
        }
    }
    
    override func setupViews() {
        self.addSubview(self.signUpLabel)
        self.addSubview(self.userArtistContainerView)
        self.userArtistContainerView.addSubview(self.userButton)
        self.userArtistContainerView.addSubview(self.artistButton)
        self.addSubview(self.userBottomLineView)
        self.addSubview(self.artistBottomLineView)
        self.addSubview(self.comnfirmMessageContainerView)
        self.comnfirmMessageContainerView.addSubview(self.followUpLabel)
        self.comnfirmMessageContainerView.addSubview(self.signUpInfoSymbol)
        self.addSubview(self.userNameTextField)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.confirmPasswordTextField)
        self.addSubview(self.signUpButton)
        self.addSubview(self.activityIndicator)
        self.addSubview(self.authOptionsView)
        self.addSubview(self.alreadyHaveAccountButton)
    }
    
    override func setupConstraints() {
        self.authOptionsViewConstraints()
        self.signUpLabelConstraints()
        self.userArtistContainerViewConstraints()
        self.userButtonConstraints()
        self.artistButtonConstraints()
        self.userBottomLineViewConstraints()
        self.artistBottomLineViewConstraints()
        self.followUpEmailLabelConstraints()
        self.comnfirmMessageContainerViewConstraints()
        self.signUpInfoSymbolConstraints()
        self.userNameTextFieldConstraints()
        self.emailTextFieldConstraints()
        self.passwordTextFieldConstraints()
        self.confirmPasswordTextFieldConstraints()
        self.signUpButtonConstraints()
        self.activityIndicator.snp.makeConstraints { make in
            make.center.equalTo(self.signUpButton)
        }

        self.alreadyHaveAccountButtonConstraints()
        
        preload()
    }
    
    private func preload() {
        self.artistButtonTapped()
    }
    
    private func signUpLabelConstraints() {
        self.signUpLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(78)
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(38)
            make.trailing.equalToSuperview()
        }
    }
    
    private func userArtistContainerViewConstraints() {
        self.userArtistContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(48)
            make.top.equalTo(self.signUpLabel.snp.bottom).offset(12)
        }
    }
    
    private func userButtonConstraints() {
        self.userButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().dividedBy(2)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(self.userArtistContainerView.snp.width).dividedBy(2)
        }
    }
    
    private func artistButtonConstraints() {
        self.artistButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(self.userArtistContainerView.snp.width).dividedBy(2)
        }
    }
    
    private func userBottomLineViewConstraints() {
        self.userBottomLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.top.equalTo(self.userArtistContainerView.snp.bottom)
        }
    }
    
    private func artistBottomLineViewConstraints() {
        self.artistBottomLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.top.equalTo(self.userArtistContainerView.snp.bottom)
        }
    }
    
    
    private func comnfirmMessageContainerViewConstraints() {
        self.comnfirmMessageContainerView.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.top.equalTo(self.userBottomLineView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    private func followUpEmailLabelConstraints() {
        self.followUpLabel.snp.makeConstraints { make in
            make.bottom.equalTo(comnfirmMessageContainerView)
            make.leading.equalTo(self.signUpInfoSymbol.snp.trailing).offset(8)
            make.height.equalTo(self.comnfirmMessageContainerView)
            make.trailing.equalTo(self.userNameTextField)
        }
    }
    
    private func signUpInfoSymbolConstraints() {
        self.signUpInfoSymbol.snp.makeConstraints { make in
            make.leading.equalTo(self.userNameTextField.snp.leading)
            make.bottom.equalTo(self.followUpLabel.snp.centerY)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
    }
    
    private func userNameTextFieldConstraints() {
        self.userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(self.comnfirmMessageContainerView.snp.bottom).offset(32)
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
    
    private func signUpButtonConstraints() {
        self.signUpButton.snp.makeConstraints { make in
            make.top.equalTo(self.confirmPasswordTextField.snp.bottom).offset(32)
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
            make.bottom.equalTo(self.alreadyHaveAccountButton.snp.top).offset(-32)
        }
    }
    
    private func alreadyHaveAccountButtonConstraints() {
        self.alreadyHaveAccountButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.trailing.equalToSuperview()
            make.height.equalTo(17)
            make.leading.equalToSuperview()
        }
    }
}
