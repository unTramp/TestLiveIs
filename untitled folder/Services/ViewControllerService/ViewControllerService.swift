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
}

class ViewControllerService {
    static var shared = ViewControllerService()
    
    func getViwController(_ name: ViewControllerName) -> UIViewController {
        switch name {
        case .auth:
            return AuthorizationViewController()
        case .create:
            return DetailsDefaultViewController()
        }
    }
}
