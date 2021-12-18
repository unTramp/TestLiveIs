//
//  RundomNumberService.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 18.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation

class RandomNumberService: RandomNumber {
    func nextRandomInt() -> Int {
        return Int(arc4random_uniform(99))
    }
    
    
}
