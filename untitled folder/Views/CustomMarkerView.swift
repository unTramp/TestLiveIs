//
//  CustomMarkerView.swift
//  googlMapTutuorial2
//
//  Created by Muskan on 12/17/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import Foundation
import UIKit

class CustomMarkerView: UIView {
    
    let bigCircle: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        v.layer.cornerRadius = 35
        return v
    }()
    
    let middleCircle: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 16
        return v
    }()
    
    
    let smallCircle: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "25A0F2")
        v.layer.cornerRadius = 8
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(bigCircle)
        self.bigCircle.addSubview(self.middleCircle)
        self.middleCircle.addSubview(self.smallCircle)
    }
    
    private func setupConstraints() {
        self.bigCircleConstraints()
        self.middleCircleConstraints()
        self.smallCircleConstraints()
    }
    
    private func bigCircleConstraints() {
        self.bigCircle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func middleCircleConstraints() {
        self.middleCircle.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(32)
            make.center.equalToSuperview()
        }
    }
    
    private func smallCircleConstraints() {
        self.smallCircle.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.width.equalTo(16)
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}









