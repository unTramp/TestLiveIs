//
//  ViewControllerService.swift
//  LiveIs
//
//  Created by Andrey Dorofeev on 9/7/21.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import UIKit

enum ViewControllerName {
    case auth
    case create
    case register
    case success
}

class ViewControllerService {
    static var shared = ViewControllerService()
    private var viewControllers = [AuthViewController(), CreateEventViewController(), RegisterViewController(), SuccessConfirmationViewController()]
    
    func getViwController(_ name: ViewControllerName) -> UIViewController {
        switch name {
        case .auth:
            return viewControllers[0]
        case .create:
            return viewControllers[1]
        case .register:
            return viewControllers[2]
        case .success:
            return viewControllers[3]
        }
    }
}
