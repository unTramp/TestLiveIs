//
//  UserArtistContainerView.swift
//  LiveIs
//
//  Created by Андрей Дорофеев on 22.12.2021.
//  Copyright © 2021 untramp. All rights reserved.
//

import Foundation
import UIKit

class UserArtistButtonGroupView: View {
    
    override func didAddSubview(_ subview: UIView) {
        artistButtonTapped()
    }
    
    convenience init(_ didTapUserButtonHandler: @escaping (()->(Void)),_ didTapArtistButtonHandler: @escaping (()->(Void))) {
        self.init()
        self.didTapUserButtonHandler = didTapUserButtonHandler
        self.didTapArtistButtonHandler = didTapArtistButtonHandler
    }
    
    private lazy var userArtistView: UIView = {
        let v = UIView()
        return v
    }()
    
    private lazy var userButton: UIButton = {
        let v = UIButton()
        v.clipsToBounds = true
        v.setTitle("User", for: .normal)
        v.setTitleColor(.customBlue, for: .normal)
        v.setTitleColor(.systemGray, for: .highlighted)
        v.titleLabel?.font = .fontRubikSize(17)
        v.addTarget(self, action: #selector(userButtonTap), for: .touchUpInside)
        return v
    }()
    
    var didTapUserButtonHandler: (() -> Void)?
    
    @objc private func userButtonTap() {
        self.userButtonTapped()
        self.didTapUserButtonHandler?()
    }
    
    @objc func userButtonTapped() {
        self.artistButton.isUserInteractionEnabled = true
        self.userButton.isUserInteractionEnabled = false
        self.artistButton.isHighlighted = true
        self.artistBottomLineView.isHidden = true
        self.userBottomLineView.isHidden = false
    }
    
    private lazy var artistButton: UIButton = {
        let v = UIButton()
        v.clipsToBounds = true
        v.setTitle("Artist", for: .normal)
        v.setTitleColor(.customBlue, for: .normal)
        v.setTitleColor(.systemGray, for: .highlighted)
        v.titleLabel?.font = .fontRubikSize(17)
        v.addTarget(self, action: #selector(artistButtonTap), for: .touchUpInside)
        return v
    }()
    
    var didTapArtistButtonHandler: (() -> Void)?
    
    @objc private func artistButtonTap() {
        self.artistButtonTapped()
        self.didTapArtistButtonHandler?()
    }
    
    @objc func artistButtonTapped() {
        self.userButton.isUserInteractionEnabled = true
        self.artistButton.isUserInteractionEnabled = false
        self.userButton.isHighlighted = true
        self.artistBottomLineView.isHidden = false
        self.userBottomLineView.isHidden = true
    }
    
    private lazy var userBottomLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .customBlue
        return v
    }()
    
    private lazy var artistBottomLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .customBlue
        return v
    }()
    
    
    override func setupViews() {
        self.addSubview(self.userArtistView)
        self.userArtistView.addSubview(self.userButton)
        self.userArtistView.addSubview(self.artistButton)
        self.userArtistView.addSubview(self.userBottomLineView)
        self.userArtistView.addSubview(self.artistBottomLineView)
    }
    
    override func setupConstraints() {
        self.userArtistContainerViewConstraints()
        self.userButtonConstraints()
        self.artistButtonConstraints()
        self.userBottomLineViewConstraints()
        self.artistBottomLineViewConstraints()
    }
    
    private func userArtistContainerViewConstraints() {
        self.userArtistView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func userButtonConstraints() {
        self.userButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().dividedBy(2)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(self.userArtistView.snp.width).dividedBy(2)
        }
    }
    
    private func artistButtonConstraints() {
        self.artistButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(self.userArtistView.snp.width).dividedBy(2)
        }
    }
    
    private func userBottomLineViewConstraints() {
        self.userBottomLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview()
        }
    }
    
    private func artistBottomLineViewConstraints() {
        self.artistBottomLineView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
            make.bottom.equalToSuperview()
        }
    }
    
}
