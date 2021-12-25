//
//  InfoMessageView.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 25.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import UIKit

class InfoMessageView: View {
    
    private lazy var confirmMessageContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.systemGray6
        return v
    }()
    
    private lazy var followUpLabel:  UILabel = {
        let v = UILabel()
        v.textColor = .customBlue
        v.text = "Here should be your text"
        v.font = UIFont(name:"Rubik", size: 14.0)
        v.lineBreakMode = .byWordWrapping
        v.numberOfLines = 0
        return v
    }()
    
    private lazy var infoSymbol: UIButton = {
        let v = UIButton(type: .infoDark)
        v.isUserInteractionEnabled = false
        return v
    }()
    
    override func setupViews() {
        self.addSubview(self.confirmMessageContainerView)
        self.confirmMessageContainerView.addSubview(self.followUpLabel)
        self.confirmMessageContainerView.addSubview(self.infoSymbol)
    }
    
    override func setupConstraints() {
        self.confirmMessageContainerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.followUpEmailLabelConstraints()
        self.infoSymbolConstraints()
    }
    
    private func followUpEmailLabelConstraints() {
        self.followUpLabel.snp.makeConstraints { make in
            make.bottom.equalTo(confirmMessageContainerView)
            make.leading.equalTo(self.infoSymbol.snp.trailing).offset(8)
            make.height.equalTo(self.confirmMessageContainerView)
            make.trailing.equalToSuperview().inset(32)
        }
    }
    
    private func infoSymbolConstraints() {
        self.infoSymbol.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.bottom.equalTo(self.followUpLabel.snp.centerY)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
    }
    
    convenience init(with message: String) {
        self.init()
        self.followUpLabel.text = message
    }
}
