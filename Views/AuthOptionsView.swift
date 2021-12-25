//
//  AuthOptionsView.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 21.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import UIKit

class AuthOptionsView: View {
    
    private lazy var signUpWithLabel :  UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = .customLightGray
        v.text = " "
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
    
    override func setupViews() {
        self.addSubview(self.signUpWithLabel)
        self.addSubview(self.leftLineSignUpWith)
        self.addSubview(self.rightLineSignUpWith)
        self.addSubview(self.signWithGoogleLogoView)
        self.addSubview(self.signWithAppleLogoView)
        self.addSubview(self.signWithFacebookLogoView)
        self.signWithGoogleLogoView.addSubview(self.google_logo)
        self.signWithAppleLogoView.addSubview(self.apple_logo)
        self.signWithFacebookLogoView.addSubview(self.facebook_logo)
    }
    
    override func setupConstraints() {
        self.signUpWithLabelConstraints()
        self.leftLineSignUpWithConstraints()
        self.rightLineSignUpWithConstraints()
        self.signWithGoogleLogoViewConstraints()
        self.signWithAppleLogoViewConstraints()
        self.signWithFacebookLogoViewConstraints()
        self.google_logoConstraints()
        self.apple_logoConstraints()
        self.facebook_logoConstraints()
    }
    
    private func signUpWithLabelConstraints() {
        self.signUpWithLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalTo(12)
        }
    }
    
    private func leftLineSignUpWithConstraints() {
        self.leftLineSignUpWith.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().inset(32)
            make.trailing.greaterThanOrEqualTo(self.signUpWithLabel.snp.leading)
            make.centerY.equalTo(self.signUpWithLabel.snp.centerY)
        }
    }
    
    private func rightLineSignUpWithConstraints() {
        self.rightLineSignUpWith.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.trailing.equalToSuperview().inset(32)
            make.leading.lessThanOrEqualTo(self.signUpWithLabel.snp.trailing)
            make.centerY.equalTo(self.signUpWithLabel.snp.centerY)
        }
    }
    
    private func signWithGoogleLogoViewConstraints() {
        self.signWithGoogleLogoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(32)
            make.height.equalTo(48)
            make.width.equalTo(96)
        }
    }
    
    private func signWithAppleLogoViewConstraints() {
        self.signWithAppleLogoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(48)
            make.width.equalTo(96)
        }
    }
    
    private func signWithFacebookLogoViewConstraints() {
        self.signWithFacebookLogoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
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
    
    convenience init(with label: String) {
        self.init()
        self.signUpWithLabel.text = label
    }
}
