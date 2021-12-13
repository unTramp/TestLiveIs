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
    private var viewControllers = [AuthViewController(), CreateEventViewController()]
    
    func getViwController(_ name: ViewControllerName) -> UIViewController {
        switch name {
        case .auth:
            return viewControllers[0]
        case .create:
            return viewControllers[1]
        }
    }
}
