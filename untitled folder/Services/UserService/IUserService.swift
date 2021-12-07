//
//  IPointService.swift
//  googlMapTutuorial2
//
//  Created by Andrey Dorofeev on 12/22/20.
//  Copyright © 2020 akhil. All rights reserved.
//

import Foundation
import Firebase

protocol IUserService {
    func loadFBUsers(completion: @escaping ([UserModel]) -> Void)
}
