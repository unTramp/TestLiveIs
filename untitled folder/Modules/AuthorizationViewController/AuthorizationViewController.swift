//
//  AuthorizationViewController.swift
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


class AuthorizationViewController: UIViewController, UITextFieldDelegate {
    
    let date = Date()
    lazy var formate = self.date.getFormattedDate(format: "yyyy-MM-dd HH:mm:ss")
    
    let fb = Firestore.firestore()
    let storage = Storage.storage()
    
    var signInLabel :  UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.text = "Sign In"
        v.font = UIFont(name:"Rubik-Medium", size: 32.0)
        return v
    }()
    
    var bgImageView: UIImageView! = {
        let v = UIImageView()
        v.image = UIImage(named: "sax2")
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    var loginTextField: TextFieldWithPadding! = {
        let v = TextFieldWithPadding()
        v.attributedPlaceholder = NSAttributedString(string: "Enter e-mail",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        v.layer.cornerRadius = 8
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.layer.borderColor = UIColor(hexString: "F1F2F5").cgColor
        v.layer.borderWidth = 1
        v.placeholder = "Enter your e-mail"
        return v
    }()
    
    var passwordTextField: TextFieldWithPadding! = {
        let v = TextFieldWithPadding()
        v.attributedPlaceholder = NSAttributedString(string: "Enter password",
                                                                          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        v.layer.cornerRadius = 8
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.textColor = .black//UIColor(hexString: "ABBBCE")
        v.layer.borderColor = UIColor(hexString: "F1F2F5").cgColor
        v.layer.borderWidth = 1
        v.placeholder = "Enter your password"
        v.isSecureTextEntry = true
        return v
    }()
    
    var authorizationButton: UIButton! = {
        let v = UIButton()
        v.backgroundColor = UIColor.init(hexString: "25A0F2")
        v.layer.cornerRadius = 8
        v.titleLabel?.font =  UIFont(name: "Rubik-Medium", size: 14)
        v.setTitle("Sign in", for: .normal)
        v.addTarget(self, action: #selector(authorizationButtonTapped), for: .touchUpInside)
        return v
    }()
    
    var registrationButton: UIButton! = {
        let v = UIButton()
        v.backgroundColor = .clear
        v.layer.cornerRadius = 30
        v.titleLabel?.font = UIFont(name:"Rubik-Light", size: 17.0)
        v.setTitleColor(UIColor.white, for: .normal)
        v.setTitle("Registration", for: .normal)
        v.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        return v
    }()
    
    var continueWithLabel :  UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.textColor = UIColor(hexString: "ABBBCE")
        v.text = "or continue with"
        v.textAlignment = .center
        v.font = UIFont(name:"Rubik-Regular", size: 12.0)
        return v
    }()
    
    let leftLineContinueWith: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "F1F2F5")
        return v
    }()
    
    let rightLineContinueWith: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "F1F2F5")
        return v
    }()
    
    let signWithGoogleLogoView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.layer.borderColor = UIColor(hexString: "F1F2F5").cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    let signWithAppleLogoView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.layer.borderColor = UIColor(hexString: "F1F2F5").cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    let signWithFacebookLogoView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.layer.borderColor = UIColor(hexString: "F1F2F5").cgColor
        v.layer.borderWidth = 1
        return v
    }()
    
    var google_logo:  UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "google_logo")
        return v
    }()
    
    var apple_logo:  UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "apple_logo")
        return v
    }()
    
    var facebook_logo:  UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "facebook_logo")
        return v
    }()
    
    var dontHaveAccountLabel :  UILabel = {
        let v = UILabel()
        v.textColor = UIColor(hexString: "25A0F2")
        v.text = "Don’t have an account, create one"
        v.font = UIFont(name:"Rubik-Regular", size: 14.00)
        v.textAlignment = .center
        return v
    }()
    
    @objc private func registrationButtonTapped() {
        guard let login = self.loginTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: login.lowercased(), password: password) { [weak self] (loginResult, error) in
            guard let strongSelf = self else { return }
            if error != nil {
                print("\(error!.localizedDescription)")
            } else {
                guard let result = loginResult else { return }
                let userID = result.user.uid
                strongSelf.fb.collection("users").document(userID).setData(
                    ["email": strongSelf.loginTextField.text!.lowercased(),
                    "id": result.user.uid,
                    "date": strongSelf.formate]
                ) { (error) in
                    if error != nil {
                        print(error!.localizedDescription)
                    }
                    print("New user cerated: \(result.user.uid)")
                }
                
// MARK: Create marker
                
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
        self.navigationController?.popToRootViewController(animated: true)
        
//        guard let login = self.loginTextField.text else { return }
//        guard let password = self.passwordTextField.text else { return }
//
//        Auth.auth().signIn(withEmail: login.lowercased(), password: password) { [weak self] authResult, error in
//          guard let strongSelf = self else { return }
//            if error != nil {
//                print("\(error!.localizedDescription)")
//            } else {
//                guard let result = authResult else { return }
//                let userID = result.user.uid
//                strongSelf.fb.collection("users").document(userID).updateData(
//                    ["date" : strongSelf.formate]
//                ) { (error) in
//                    if error != nil {
//                        print("\(error!.localizedDescription)")
//                    } else {
//                        strongSelf.navigationController?.popToRootViewController(animated: true)
//                    }
//                }
//            }
//        }
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField .isEqual(self.loginTextField){
            textField.text = textField.text?.lowercased()
        }
        return true
    }


    
// MARK: Cheat
    @objc func trippleTap() {
        self.loginTextField.text = "A@gmail.com"
        self.passwordTextField.text = "Qwerty"
    }
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selfCorrection()
        self.setupViews()
        self.setupConstraints()
        
        self.trippleTap()
        //self.logInButtonTapped()
    }
    
    
    private func selfCorrection() {
        self.view.backgroundColor = .white
        self.loginTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    
    private func setupViews() {
        self.view.addSubview(self.signInLabel)
        self.view.addSubview(self.bgImageView)
        self.view.addSubview(self.loginTextField)
        self.view.addSubview(self.passwordTextField)
        self.view.addSubview(registrationButton)
        self.view.addSubview(authorizationButton)
        self.view.addSubview(self.continueWithLabel)
        self.view.addSubview(self.leftLineContinueWith)
        self.view.addSubview(self.rightLineContinueWith)
        self.view.addSubview(self.signWithGoogleLogoView)
        self.view.addSubview(self.signWithAppleLogoView)
        self.view.addSubview(self.signWithFacebookLogoView)
        self.signWithGoogleLogoView.addSubview(self.google_logo)
        self.signWithAppleLogoView.addSubview(self.apple_logo)
        self.signWithFacebookLogoView.addSubview(self.facebook_logo)
        self.view.addSubview(self.dontHaveAccountLabel)
    }
    
    
    private func setupConstraints() {
        self.signInLabelConstraints()
        self.bgImageViewConstraints()
        self.loginTextFieldConstraints()
        self.passwordTextFieldConstraints()
        self.authorizationButtonConstraints()
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
