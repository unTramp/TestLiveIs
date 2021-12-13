//
//  View.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 13.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import UIKit

class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    private func setup() {
        self.setupViews()
        self.setupConstraints()
    }
    
    func setupViews() {
    }
    
    func setupConstraints() {
    }
    
}
