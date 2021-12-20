//
//  RegisterViewController.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 18.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewModelDelegate {
    func didUpdateState() {
        
    }
    
    func didShowAlert(title: String, message: String) {
        
    }
    
    func moveTo(_ route: RegisterViewModelRoute) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
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
