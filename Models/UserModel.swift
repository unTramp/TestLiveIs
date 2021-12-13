//
//  UserModel.swift
//  googlMapTutuorial2
//
//  Created by Andrey Dorofeev on 14.01.2021.
//  Copyright © 2021 akhil. All rights reserved.
//

import Foundation

class UserModel {
    
    var email: String!
    var date: String!
    var id: String!
    
    init(_ email: String, date: String, id: String) {
        self.email = email
        self.date = date
        self.id = id
    }

    
}
