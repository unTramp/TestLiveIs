//
//  CreateEventViewController.swift
//  LiveIs
//
//  Created by Andrey Dorofeev on 9/7/21.
//  Copyright © 2021 untramp. All rights reserved.
//


import UIKit
import Foundation

class CreateEventViewController: UIViewController, MTSlideToOpenDelegate {
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }()
    
    @objc private func showCalendar() {
        guard let dateString = self.dateLabel.text else { return }
        guard let date = dateFormatter.date(from: dateString) else { return }
        let calendar = CalendarPickerViewController(baseDate: date,
                                                    selectedDateChanged: { date in
            let formatedData = self.dateFormatter.string(from: date)
            self.dateLabel.text = formatedData
        })
        
        self.present(calendar, animated: true)
    }
    
    private lazy var topView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray3
        return v
    }()
    
    private lazy var createEventLabel: UILabel = {
        let v = UILabel()
        v.textColor = .white
        v.text = "Create event"
        v.font = UIFont(name:"Rubik-Regular", size: 32.0)
        return v
    }()
    
    private lazy var performanceMessageLabel: UILabel = {
        let v = UILabel()
        v.textColor = .white
        v.text = "Let everyone know your best musical performance"
        v.font = .fontRubikSize(14)
        return v
    }()
    
    private lazy var contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    private lazy var whenMessageLabel: UILabel = {
        let v = UILabel()
        v.textColor = .customDarkBlue
        v.text = "When will the event be held?"
        v.font = .fontRubikSize(14)
        return v
    }()
    
    private lazy var dateLabel: UILabel = {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        let v = UILabel()
        v.text = dateformatter.string(from: Date())
        v.textColor = .customBlack
        v.font = .fontRubikSize(24)
        return v
    }()
    
    private lazy var calendarButton: UIButton = {
        let v = UIButton()
        v.setBackgroundImage(UIImage(named: "play_circle"), for: .normal)
        v.addTarget(self, action: #selector(showCalendar), for: .touchUpInside)
        return v
    }()
    
    private lazy var timeLabel: UILabel = {
        let v = UILabel()
        v.text = "09:00"
        v.textColor = .customBlack
        v.font = .fontRubikSize(24)
        return v
    }()
    
    private lazy var amLabel: UILabel = {
        let v = UILabel()
        v.text = "AM"
        v.textColor = .customBlue
        v.font = .fontRubikSize(14)
        return v
    }()
    
    private lazy var pmLabel: UILabel = {
        let v = UILabel()
        v.text = "PM"
        v.textColor = .customLightGray
        v.font = .fontRubikSize(14)
        return v
    }()
    
    private lazy var lineBreakView: UIView = {
        let v = UIView()
        v.backgroundColor = .customWhite
        return v
    }()
    
    private lazy var whereMessageLabel: UILabel = {
        let v = UILabel()
        v.text = "Where the events held?"
        v.textColor = .customDarkBlue
        v.font = .fontRubikSize(14)
        return v
    }()
    
    private lazy var tapMapView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.backgroundColor = .systemGray5
        return v
    }()
    
    private lazy var lineBottomBreakView: UIView = {
        let v = UIView()
        v.backgroundColor = .customWhite
        return v
    }()
    
    private lazy var priceMessageLabel: UILabel = {
        let v = UILabel()
        v.text = "Entrance price"
        v.textColor = .customDarkBlue
        v.font = .fontRubikSize(14)
        return v
    }()
    
    private lazy var priceLabel: UILabel = {
        let v = UILabel()
        v.text = "$0"
        v.textColor = .customBlack
        v.font = .fontRubikSize(24)
        return v
    }()
    
    private lazy var plusPriceButton: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "btn-plus"), for: .normal)
        return v
    } ()
    
    private lazy var minusPriceButton: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "btn-minus"), for: .normal)
        return v
    }()
    
    private lazy var sliderButtonView: MTSlideToOpenView = {
        let slide = MTSlideToOpenView(frame: CGRect(x: 26,
                                                    y: 200,
                                                    width: 317,
                                                    height: 48))
        
        slide.draggedView.backgroundColor = UIColor(red: 0.678,
                                                    green: 0.735,
                                                    blue: 0.802,
                                                    alpha: 1)
        
        slide.sliderHolderView.backgroundColor = UIColor(red: 0.678,
                                                         green: 0.735,
                                                         blue: 0.802,
                                                         alpha: 1)
        
        slide.thumnailImageView.backgroundColor  = UIColor(red: 0.678,
                                                           green: 0.735,
                                                           blue: 0.802,
                                                           alpha: 1)
        
        slide.delegate = self
        slide.textColor = .white
        slide.sliderCornerRadius = 24
        slide.sliderViewTopDistance = 0
        slide.labelText = "Complete the forms"
        slide.textLabel.textAlignment = .right
        slide.thumbnailViewStartingDistance = 17
        slide.thumnailImageView.image = UIImage(named: "btn-primary")

        return slide
    }()
    
    func mtSlideToOpenDelegateDidFinish(_ sender: MTSlideToOpenView) {
        sender.resetStateWithAnimation(true)
        let successViewController = SuccessConfirmationViewController()
        
        successViewController.setCloseButtonTappedCompletionHandler {
            successViewController.dismiss(animated: true) {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        
        self.present(successViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViews() {
        self.view.addSubview(self.topView)
        self.topView.addSubview(self.createEventLabel)
        self.topView.addSubview(self.performanceMessageLabel)
        self.view.addSubview(self.contentView)
        self.contentView.addSubview(self.whenMessageLabel)
        self.contentView.addSubview(self.dateLabel)
        self.contentView.addSubview(self.calendarButton)
        self.contentView.addSubview(self.timeLabel)
        self.contentView.addSubview(self.pmLabel)
        self.contentView.addSubview(self.amLabel)
        self.contentView.addSubview(lineBreakView)
        self.contentView.addSubview(self.whereMessageLabel)
        self.contentView.addSubview(self.tapMapView)
        self.contentView.addSubview(self.lineBottomBreakView)
        self.contentView.addSubview(self.priceMessageLabel)
        self.contentView.addSubview(self.priceLabel)
        self.contentView.addSubview(self.plusPriceButton)
        self.contentView.addSubview(self.minusPriceButton)
        self.contentView.addSubview(self.sliderButtonView)
    }
    
    
    private func setupConstraints() {
        self.topViewConstraints()
        self.eventLabelConstraints()
        self.performanceMessageLabelConstraints()
        self.contentViewConstraints()
        self.whenMessageLabelConstraints()
        self.dateLabelConstraints()
        self.calendarButtonConstraints()
        self.timeLabelConstraints()
        self.pmLabelConstraints()
        self.amLabelConstraints()
        self.lineBreakViewConstraints()
        self.whereMessageLabelConstraints()
        self.tapMapViewConstraints()
        self.lineBottomBreakViewConstratins()
        self.priceMessageLabelConstraints()
        self.priceLabelConstraints()
        self.plusPriceButtonConstraints()
        self.minusPriceButtonConstraints()
        self.sliderButtonContainterConstraints()
    }
        
    private func topViewConstraints() {
        self.topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(182)
        }
    }
    
    private func eventLabelConstraints() {
        self.createEventLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(38)
            make.top.equalToSuperview().inset(94)
            make.trailing.equalToSuperview()
        }
    }
    
    private func performanceMessageLabelConstraints() {
        self.performanceMessageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview()
            make.height.equalTo(17)
            make.top.equalTo(self.createEventLabel.snp.bottom).offset(12)
        }
    }
    
    private func contentViewConstraints() {
        self.contentView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.top.equalTo(self.topView.snp.bottom)
        }
    }
    
    private func whenMessageLabelConstraints() {
        self.whenMessageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview()
            make.height.equalTo(17)
            make.top.equalTo(self.topView.snp.bottom).offset(24)
        }
    }
    
    private func dateLabelConstraints() {
        self.dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(28)
            make.trailing.equalTo(self.calendarButton.snp.leading)
            make.top.equalTo(self.whenMessageLabel.snp.bottom).offset(12)
        }
    }
    
    private func calendarButtonConstraints() {
        self.calendarButton.snp.makeConstraints { make in
            make.height.equalTo(self.dateLabel.snp.height)
            make.trailing.equalTo(self.amLabel.snp.trailing)
            make.centerY.equalTo(self.dateLabel.snp.centerY)
            make.width.equalTo(self.dateLabel.snp.height)
        }
    }
    
    private func timeLabelConstraints() {
        self.timeLabel.snp.makeConstraints { make in
            make.height.equalTo(28)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview()
            make.top.equalTo(self.dateLabel.snp.bottom).offset(16)
        }
    }
    
    private func pmLabelConstraints() {
        self.pmLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(17)
            make.width.equalTo(21)
            make.centerY.equalTo(self.timeLabel.snp.centerY)
        }
    }
    
    private func amLabelConstraints() {
        self.amLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.pmLabel.snp.leading).offset(-16)
            make.height.equalTo(17)
            make.width.equalTo(21)
            make.centerY.equalTo(self.timeLabel.snp.centerY)
        }
    }
    
    private func lineBreakViewConstraints() {
        self.lineBreakView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(self.timeLabel.snp.bottom).offset(24)
        }
    }
    
    private func whereMessageLabelConstraints() {
        self.whereMessageLabel.snp.makeConstraints { make in
            make.height.equalTo(17)
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview()
            make.top.equalTo(self.lineBreakView.snp.bottom).offset(24)
        }
    }
    
    private func tapMapViewConstraints() {
        self.tapMapView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(self.whereMessageLabel.snp.bottom).offset(12)
            make.height.equalTo(121)
        }
    }
    
    private func lineBottomBreakViewConstratins() {
        self.lineBottomBreakView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(1)
            make.top.equalTo(self.tapMapView.snp.bottom).offset(24)
        }
    }
    
    private func priceMessageLabelConstraints() {
        self.priceMessageLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(17)
            make.top.equalTo(self.lineBottomBreakView.snp.bottom).offset(24)
            make.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func priceLabelConstraints() {
        self.priceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.height.equalTo(28)
            make.top.equalTo(self.priceMessageLabel.snp.bottom).offset(12)
            make.width.equalTo(100)
        }
    }
    
    private func plusPriceButtonConstraints() {
        self.plusPriceButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.centerY.equalTo(self.priceLabel.snp.centerY)
        }
    }
    
    private func minusPriceButtonConstraints() {
        self.minusPriceButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.plusPriceButton.snp.leading).offset(-20)
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.centerY.equalTo(self.priceLabel.snp.centerY)
        }
    }
    
    private func sliderButtonContainterConstraints() {
        self.sliderButtonView.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.leading.equalToSuperview().inset(36)
            make.trailing.equalToSuperview().inset(36)
            make.top.equalTo(priceLabel.snp.bottom).offset(76)
        }
    }
}
