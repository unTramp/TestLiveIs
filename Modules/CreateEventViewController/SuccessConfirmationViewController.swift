//
//  SuccessConfirmationViewController.swift
//  LiveIs
//
//  Created by Andrey Dorofeev on 9/26/21.
//  Copyright © 2021 untramp. All rights reserved.
//

import UIKit

class SuccessConfirmationViewController: UIViewController {
    
    lazy var closeButton: UIButton = {
        let v = ButtonFactory.close
        v.addTarget(self, action: #selector(didTapCloseButton),
                    for: .touchUpInside)
        return v
    }()
    
    private var closeButtonTappedCompletionHandler: (() -> Void)?
    
    lazy var topLabel: UILabel = {
        let v = UILabel()
        v.textColor = .customWhite
        v.text = "It's Live"
        v.font = UIFont(name:"Rubik-Medium", size: 32.0)
        return v
    }()
    
    lazy var shareButton: UIButton = {
        let v = ButtonFactory.share
        v.addTarget(self, action: #selector(didTapShareButton),
                    for: .touchUpInside)
        return v
    }()
    
    private var shareButtonTappedCompletionHandler: (() -> Void)?
    
    lazy var cardView: UIView  = {
        let v = UIView()
        v.backgroundColor = .customWhite
        v.layer.cornerRadius = 20
        return v
    }()
    
    lazy var leadingCardCircle: UIView = {
        let v = UIView()
        v.backgroundColor = .orange
        v.layer.cornerRadius = 16
        return v
    }()
    
    lazy var trailingCardCircle: UIView = {
        let v = UIView()
        v.backgroundColor = .orange
        v.layer.cornerRadius = 16
        return v
    }()
    
    lazy var albumPicture: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = .systemGray4
        v.layer.cornerRadius = 16
        return v
    }()
    
    lazy var bandNameLabel: UILabel = {
        let v = UILabel()
        v.text = "Band Name"
        v.textAlignment = .center
        v.layer.cornerRadius = 8
        v.clipsToBounds = true
        return v
    }()
    
    lazy var datePlacePriceView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 16
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.5
        return v
    }()
    
    lazy var placeLabel: UILabel = {
        let v = UILabel()
        v.text = "Place name"
        return v
    }()
    
    lazy var placeAddress: UILabel = {
        let v = UILabel()
        v.text = "Some Address, 75008"
        return v
    }()
    
    lazy var horisontLineView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.systemGray4
        return v
    }()
    
    lazy var centerVerticalLineView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.systemGray4
        return v
    }()
    
    lazy var dateLabel: UILabel = {
        let v = UILabel()
        v.text = "Date"
        v.textAlignment = .center
        return v
    }()
    
    lazy var priceLabel: UILabel = {
        let v = UILabel()
        v.text = "Entrance price"
        v.textAlignment = .center
        return v
    }()
    
    lazy var dateLabelResult: UILabel = {
        let v = UILabel()
        v.textAlignment = .center
        v.text = "SEP 17 / 4 PM"
        return v
    }()
    
    lazy var priceLabelResult: UILabel = {
        let v = UILabel()
        v.textAlignment = .center
        v.text = "$25"
        return v
    }()
    
    lazy var bookTicketView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 16
        v.layer.borderColor = UIColor.systemGray4.cgColor
        v.layer.borderWidth = 0.5
        return v
    }()
    
    lazy var bookTicketTitleLabel: UILabel = {
        let v = UILabel()
        v.textAlignment = .center
        v.text = "Book your ticket now"
        return v
    }()
    
    lazy var bookTicketNumberTitleLabel: UILabel = {
        let v = UILabel()
        v.textAlignment = .center
        v.text = "+33 134 377 377"
        return v
    }()
    
    lazy var seeEventListButton: UIButton = {
        let v = ButtonFactory.seeEventListButton
        v.addTarget(self, action: #selector(didTapSeeEventListButton),
                    for: .touchUpInside)
        return v
    }()
    
    private var setSeeEventListButtonTappedCompletionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        self.setupViews()
        self.setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViews() {
        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.topLabel)
        self.view.addSubview(self.shareButton)
        self.view.addSubview(self.cardView)
        self.view.addSubview(self.leadingCardCircle)
        self.view.addSubview(self.trailingCardCircle)
        self.cardView.addSubview(self.albumPicture)
        self.cardView.addSubview(self.bandNameLabel)
        self.cardView.addSubview(self.datePlacePriceView)
        self.datePlacePriceView.addSubview(self.placeLabel)
        self.datePlacePriceView.addSubview(self.placeAddress)
        self.datePlacePriceView.addSubview(self.horisontLineView)
        self.datePlacePriceView.addSubview(self.centerVerticalLineView)
        self.datePlacePriceView.addSubview(self.dateLabel)
        self.datePlacePriceView.addSubview(self.priceLabel)
        self.datePlacePriceView.addSubview(self.dateLabelResult)
        self.datePlacePriceView.addSubview(self.priceLabelResult)
        self.cardView.addSubview(self.bookTicketView)
        self.cardView.addSubview(self.bookTicketTitleLabel)
        self.cardView.addSubview(self.bookTicketNumberTitleLabel)
        self.view.addSubview(self.seeEventListButton)
    }
    
    private func setupConstraints() {
        self.closeButtonConstraints()
        self.topLabelConstraints()
        self.shareButtonConstraints()
        self.cardViewConstraints()
        self.leadingCardCircleConstraints()
        self.trailingCardCircleConstraints()
        self.albumPictureConstraints()
        self.bandNameLabelConstraints()
        self.datePlacePriceViewConstraints()
        self.placeLabelConstraints()
        self.horisontLineConstraints()
        self.dateLabelConstraints()
        self.priceLabelConstraints()
        self.dateResultConstraints()
        self.priceLabelConstraints()
        self.priceAddressConstraints()
        self.bookTicketViewConstraints()
        self.bookTicketTitleLabelConstraints()
        self.bookTicketNumberTitleConstraints()
        self.seeEventListButtonConstraints()
    }
    
    private func closeButtonConstraints() {
        self.closeButton.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(58)
        }
    }
    
    private func topLabelConstraints() {
        self.topLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalTo(self.shareButton.snp.leading)
            make.top.equalTo(self.closeButton.snp.bottom).offset(12)
            make.height.equalTo(38)
        }
    }
    
    private func shareButtonConstraints() {
        self.shareButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(48)
            make.centerY.equalTo(self.topLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func cardViewConstraints() {
        self.cardView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(424)
            make.top.equalToSuperview().inset(164)
        }
    }
    
    private func leadingCardCircleConstraints() {
        self.leadingCardCircle.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(32)
            make.centerX.equalTo(self.cardView.snp.left)
            make.centerY.equalTo(self.cardView.snp.bottom).offset(-99)
        }
    }
    
    private func trailingCardCircleConstraints() {
        self.trailingCardCircle.snp.makeConstraints { make in
            make.height.equalTo(32)
            make.width.equalTo(32)
            make.centerX.equalTo(self.cardView.snp.right)
            make.centerY.equalTo(self.cardView.snp.bottom).offset(-99)
        }
    }
    
    private func albumPictureConstraints() {
        self.albumPicture.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.width.equalTo(64)
            make.top.equalTo(16)
            make.centerX.equalToSuperview()
        }
    }
    
    private func bandNameLabelConstraints() {
        self.bandNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.albumPicture.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(21)
        }
    }
    
    private func datePlacePriceViewConstraints() {
        self.datePlacePriceView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self.bandNameLabel.snp.bottom).offset(24)
            make.height.equalTo(160)
        }
    }
    
    private func placeLabelConstraints() {
        self.placeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.equalToSuperview().inset(48)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(17)
        }
    }
    
    private func horisontLineConstraints() {
        self.horisontLineView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(85)
            make.height.equalTo(1)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    private func centerVerticalLineViewConstraints() {
        self.centerVerticalLineView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(1)
            make.top.equalTo(self.horisontLineView.snp.bottom).offset(16)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    private func dateLabelConstraints() {
        self.dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.horisontLineView.snp.bottom).offset(11)
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(17)
            make.trailing.equalTo(self.horisontLineView.snp.centerX).offset(-16)
        }
    }
    
    private func priceLabelConstraints() {
        self.priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.horisontLineView.snp.bottom).offset(11)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(17)
            make.leading.equalTo(self.horisontLineView.snp.centerX).offset(16)
        }
    }
    
    private func dateResultConstraints() {
        self.dateLabelResult.snp.makeConstraints { make in
            make.top.equalTo(self.dateLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.dateLabel.snp.leading)
            make.trailing.equalTo(self.dateLabel.snp.trailing)
            make.height.equalTo(17)
        }
    }
    
    private func priceLabelResultConstraints() {
        self.priceLabelResult.snp.makeConstraints { make in
            make.top.equalTo(self.priceLabel.snp.bottom).offset(8)
            make.leading.equalTo(self.priceLabel.snp.leading)
            make.trailing.equalTo(self.priceLabel.snp.trailing)
            make.height.equalTo(17)
        }
    }
    
    private func priceAddressConstraints() {
        self.placeAddress.snp.makeConstraints { make in
            make.top.equalTo(self.placeLabel.snp.bottom).offset(8)
            make.height.equalTo(28)
            make.trailing.equalToSuperview().inset(16)
            make.leading.equalTo(self.placeLabel.snp.leading)
        }
    }
    
    private func bookTicketViewConstraints() {
        self.bookTicketView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.bottom.equalToSuperview().inset(12)
            make.height.equalTo(63)
        }
    }
    
    private func bookTicketTitleLabelConstraints() {
        self.bookTicketTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.bookTicketView.snp.top).offset(12)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(17)
        }
    }
    
    private func bookTicketNumberTitleConstraints() {
        self.bookTicketNumberTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.bookTicketTitleLabel.snp.bottom).offset(8)
            make.trailing.equalTo(self.bookTicketTitleLabel.snp.trailing)
            make.leading.equalTo(self.bookTicketTitleLabel.snp.leading)
            make.height.equalTo(14)
        }
    }
    
    private func seeEventListButtonConstraints() {
        self.seeEventListButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(24)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(48)
        }
    }
    
    private func setupButtonsHandlers() {
        self.setSeeEventListButtonTappedCompletionHandler {
            
        }
        
        self.setShareButtonTappedCompletionHandler {
            
        }
    }
    
    
    func setCloseButtonTappedCompletionHandler(completion: @escaping (() -> Void)) {
        self.closeButtonTappedCompletionHandler = completion
    }
    
    @objc private func didTapCloseButton() {
        guard let closeButtonTapped = self.closeButtonTappedCompletionHandler else { return }
        closeButtonTapped()
    }
    
    func setShareButtonTappedCompletionHandler(completion: @escaping (() -> Void)) {
        self.shareButtonTappedCompletionHandler = completion
    }
    
    @objc private func didTapShareButton() {
        guard let shareButtonTapped = self.shareButtonTappedCompletionHandler else { return }
        shareButtonTapped()
    }
    
    func setSeeEventListButtonTappedCompletionHandler(completion: @escaping (() -> Void)) {
        self.setSeeEventListButtonTappedCompletionHandler = completion
    }
    
    @objc private func didTapSeeEventListButton() {
        guard let seeEventListButtonTapped = self.setSeeEventListButtonTappedCompletionHandler else { return }
        seeEventListButtonTapped()
    }
}
