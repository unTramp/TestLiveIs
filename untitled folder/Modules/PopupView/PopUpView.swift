//
//  PopUpMenuView.swift
//  googlMapTutuorial2
//
//  Created by Andrey Dorofeev on 2/25/21.
//  Copyright © 2021 akhil. All rights reserved.
//

import UIKit

class PopUpView: UIView {
    
    let contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 20
        v.layer.shadowOffset = CGSize(width: 0, height: -4)
        v.layer.shadowRadius = 24
        v.layer.shadowColor = UIColor(red: 0.08, green: 0.139, blue: 0.254, alpha: 0.16).cgColor
        v.layer.shadowOpacity = 1
        return v
    }()
    
    let popUpMenuPicker: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "F1F2F5")
        view.layer.cornerRadius = 2
        return view
    }()
    
    let bandNameLabel: UILabel = {
        let v = UILabel()
        v.text = "Dezery"
        v.font = UIFont(name: "Rubik-Medium", size: 18)
        v.textColor = UIColor(hexString: "#42556B")
        return v
    }()
    
    let albumCoverImageView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "IMG_0025"))
        v.clipsToBounds = true
        v.layer.cornerRadius = 9
        return v
    }()
    
    let shadowAlbumCoverView: UIView = {
        let v = UIView()
        v.layer.shadowOffset = CGSize(width: 0, height: 4)
        v.layer.shadowRadius = 9
        v.layer.shadowColor = UIColor(hexString: "142341").withAlphaComponent(0.3).cgColor
        v.layer.shadowOpacity = 1
        return v
    }()
    
    let timeLabel: UILabel = {
        let v = UILabel()
        v.text = "AUG 27 / 7 PM"
        v.font = UIFont(name: "Rubik-Regular", size: 14)
        v.textColor = UIColor(hexString: "9CA9B8")
        return v
    }()
    
    let priceView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "25A0F2").withAlphaComponent(0.2)
        v.layer.cornerRadius = 4
        return v
    }()
    
    let priceLabel: UILabel = {
        let v = UILabel()
        v.text = "$ 250"
        v.font = UIFont(name: "Rubik-Regular", size: 14)
        v.textColor = UIColor(hexString: "25A0F2")
        v.textAlignment = .center
        return v
    }()
    
    let adressRectView: UIView = {
        let v = UIView()
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(hexString: "F1F2F5").cgColor
        v.layer.cornerRadius = 16
        return v
    }()
    
    let adressRectLineView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "F1F2F5")
        return v
    }()
    
    let placeNameLabel: UILabel = {
        let v = UILabel()
        v.text = "Arc de Triomphe"
        v.textColor = UIColor(hexString: "42556B")
        v.font = UIFont(name: "Rubik-Medium", size: 14)
        return v
    }()
    
    let placeAderssLabel: UILabel = {
        let v = UILabel()
        v.text = "Pl. Charles de Gaulle, 75008 Paris, France"
        v.textColor = UIColor(hexString: "9CA9B8")
        v.font = UIFont(name: "Rubik-Regular", size: 12)
        return v
    }()
    
    let bookTicketLabel: UILabel = {
        let v = UILabel()
        v.text = "Book your ticket now"
        v.textColor = UIColor(hexString: "42556B")
        v.font = UIFont(name: "Rubik-Medium", size: 14)
        return v
    }()
    
    let phoneNumberLabel: UILabel = {
        let v = UILabel()
        v.text = "Call to +33 155 377 377"
        v.textColor = UIColor(hexString: "25A0F2")
        v.font = UIFont(name: "Rubik-Regular", size: 12)
        return v
    }()
    
    let lovcationPitImageView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "small_pin"))
        return v
    }()
    
    let phoneBigCircleView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "25A0F2").withAlphaComponent(0.3)
        v.layer.cornerRadius = 20
        return v
    }()
    
    let phoneSmallCircleView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "25A0F2")
        v.layer.cornerRadius = 18
        return v
    }()
    
    let phoneIconImageView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "phone"))
        return v
    }()
    
    var addEventButtonBackgroundview: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "25A0F2").withAlphaComponent(0.2)
        v.layer.cornerRadius = 26
        return v
    }()
    
    var addEventButton: UIButton = {
        let v = ButtonFactory.shared.getButton(.addevent)
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.selfCorrection()
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func selfCorrection() {
        self.backgroundColor = .clear
    }
    
    private func setupViews() {
        self.addSubview(self.contentView)
        self.addSubview(self.addEventButtonBackgroundview)
        self.addEventButtonBackgroundview.addSubview(self.addEventButton)
        self.contentView.addSubview(self.popUpMenuPicker)
        self.contentView.addSubview(self.bandNameLabel)
        self.contentView.addSubview(self.shadowAlbumCoverView)
        self.shadowAlbumCoverView.addSubview(self.albumCoverImageView)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.priceView)
        self.priceView.addSubview(self.priceLabel)
        self.contentView.addSubview(self.adressRectView)
        self.adressRectView.addSubview(self.adressRectLineView)
        self.adressRectView.addSubview(self.placeNameLabel)
        self.adressRectView.addSubview(self.placeAderssLabel)
        self.adressRectView.addSubview(self.bookTicketLabel)
        self.adressRectView.addSubview(self.phoneNumberLabel)
        self.adressRectView.addSubview(self.lovcationPitImageView)
        self.adressRectView.addSubview(self.phoneBigCircleView)
        self.phoneBigCircleView.addSubview(self.phoneSmallCircleView)
        self.phoneSmallCircleView.addSubview(self.phoneIconImageView)
    }
    
    private func setupConstraints() {
        self.contentViewConstraints()
        self.addEventButtonBackViewConstraints()
        self.addEventButtonConstraints()
        self.popUpMenuPickerConstraints()
        self.shadowAlbumCoverviewConstraints()
        self.albumCoverImageViewConstraints()
        self.bandNameLabelConstraints()
        self.timeLabelConstraints()
        self.priceViewConstraints()
        self.priceLabelConstraints()
        self.adressRectViewConstraints()
        self.adressRectLineViewConstraints()
        self.placeNameLabelConstraints()
        self.placeAderssLabelConstraints()
        self.bookTicketLabelConstraints()
        self.phoneNumberLabelConstraints()
        self.lovcationPitImageViewConstraints()
        self.phoneBigCircleViewConstraints()
        self.phoneSmallCircleViewConstraints()
        self.phoneIconImageViewConstraints()
    }
    
    
    private func contentViewConstraints() {
        self.contentView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(64)
            make.bottom.equalToSuperview()
        }
    }
    
    private func addEventButtonBackViewConstraints() {
        self.addEventButtonBackgroundview.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp.top).offset(-24)
            make.width.equalTo(84)
            make.height.equalTo(52)
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func addEventButtonConstraints() {
        self.addEventButton.snp.makeConstraints { make in
            make.center.equalTo(self.addEventButtonBackgroundview.snp.center)
            make.width.equalTo(72)
            make.height.equalTo(40)
        }
    }
    private func popUpMenuPickerConstraints() {
        self.popUpMenuPicker.snp.makeConstraints { make in
            make.height.equalTo(4)
            make.width.equalTo(60)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(8)
        }
    }
    
    private func shadowAlbumCoverviewConstraints() {
        self.shadowAlbumCoverView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func albumCoverImageViewConstraints() {
        self.albumCoverImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func bandNameLabelConstraints() {
        self.bandNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(32)
            make.height.equalTo(21)
            make.trailing.equalTo(self.albumCoverImageView.snp.leading).offset(-24)
        }
    }
    
    private func timeLabelConstraints() {
        self.timeLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(self.bandNameLabel.snp.bottom).offset(12)
            make.trailing.equalTo(self.albumCoverImageView.snp.leading).offset(-24)
        }
    }
    
    private func priceViewConstraints() {
        self.priceView.snp.makeConstraints { make in
            make.top.equalTo(self.timeLabel.snp.bottom).offset(8)
            make.height.equalTo(22)
            make.width.equalTo(53)
            make.leading.equalToSuperview().inset(24)
        }
    }
    
    private func priceLabelConstraints() {
        self.priceLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(4)
        }
    }
    
    private func adressRectViewConstraints() {
        self.adressRectView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(self.priceLabel.snp.bottom).offset(20)
            make.height.equalTo(142)
        }
    }
    
    private func adressRectLineViewConstraints() {
        self.adressRectLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalToSuperview()
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    private func placeNameLabelConstraints() {
        self.placeNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(48)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(17)
        }
    }
    
    private func placeAderssLabelConstraints() {
        self.placeAderssLabel.snp.makeConstraints { make in
            make.top.equalTo(self.placeNameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(48)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(14)
        }
    }
    
    private func bookTicketLabelConstraints() {
        self.bookTicketLabel.snp.makeConstraints { make in
            make.top.equalTo(adressRectLineView.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(17)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func phoneNumberLabelConstraints() {
        self.phoneNumberLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(14)
            make.top.equalTo(self.bookTicketLabel.snp.bottom).offset(8)
        }
    }
    
    private func lovcationPitImageViewConstraints() {
        self.lovcationPitImageView.snp.makeConstraints { make in
            make.height.equalTo(16.77)
            make.width.equalTo(14.17)
            make.top.equalToSuperview().inset(17.62)
            make.leading.equalToSuperview().inset(18.92)
        }
    }
    
    private func phoneBigCircleViewConstraints() {
        self.phoneBigCircleView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func phoneSmallCircleViewConstraints() {
        self.phoneSmallCircleView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
    }
    
    private func phoneIconImageViewConstraints() {
        self.phoneIconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(16.56)
            make.width.equalTo(16.61)
        }
    }
    
    
    
}
