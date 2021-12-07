//
//  CreateEventViewController.swift
//  LiveIs
//
//  Created by Andrey Dorofeev on 9/7/21.
//  Copyright © 2021 untramp. All rights reserved.
//


import UIKit
import Foundation

class DetailsDefaultViewController: UIViewController, MTSlideToOpenDelegate {
    
    var dateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .long
      return dateFormatter
    }()
    
    func mtSlideToOpenDelegateDidFinish(_ sender: MTSlideToOpenView) {
        guard let dateString = self.dateLabel.text else { return }
        guard let date = dateFormatter.date(from: dateString) else { return }
        let calendar = CalendarPickerViewController(baseDate: date, selectedDateChanged: { date in
            let formatedData = self.dateFormatter.string(from: date)
            self.dateLabel.text = formatedData
        })
        
        //self.present(calendar, animated: true)
        
        sender.resetStateWithAnimation(true)
        let setMapLocationViewController = SetMapLocationViewController()
        setMapLocationViewController.registerListener { marker in
            print(marker)
        }
        
        self.navigationController?.pushViewController(setMapLocationViewController, animated: true)
    }
    
    var topView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemGray3
        return v
    }()
    
    var createEventLabel: UILabel = {
        let v = UILabel()
        v.textColor = .white
        v.text = "Create event"
        v.font = UIFont(name:"Rubik-Regular", size: 32.0)
        return v
    }()
    
    var performanceMessageLabel: UILabel = {
        let v = UILabel()
        v.textColor = .white
        v.text = "Let everyone know your best musical performance"
        v.font = UIFont(name:"Rubik-Regular", size: 14.0)
        return v
    }()
    
    var contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()

    var whenMessageLabel: UILabel = {
        let v = UILabel()
        v.textColor = UIColor(hexString: "42556B")
        v.text = "When will the event be held?"
        v.font = UIFont(name:"Rubik-Regular", size: 14.0)
        return v
    }()

    var dateLabel: UILabel = {
        var dateFormatter: DateFormatter = {
          let dateFormatter = DateFormatter()
          dateFormatter.dateStyle = .long
          return dateFormatter
        }()
        
        let v = UILabel()
        v.text = dateFormatter.string(from: Date())
        v.textColor = UIColor(hexString: "080A0D")
        v.font = UIFont(name:"Rubik-Regular", size: 24.0)
        return v
    }()
    
    var timeLabel: UILabel = {
        let v = UILabel()
        v.text = "09:00"
        v.textColor = UIColor(hexString: "080A0D")
        v.font = UIFont(name:"Rubik-Regular", size: 24.0)
        return v
    }()
    
    var amLabel: UILabel = {
        let v = UILabel()
        v.text = "AM"
        v.textColor = UIColor(hexString: "25A0F2")
        v.font = UIFont(name:"Rubik-Regular", size: 14.0)
        return v
    }()
    
    var pmLabel: UILabel = {
        let v = UILabel()
        v.text = "PM"
        v.textColor = UIColor(hexString: "ADBCCC")
        v.font = UIFont(name:"Rubik-Regular", size: 14.0)
        return v
    }()
    
    let lineBreakView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "F1F2F5")
        return v
    }()
    
    var whereMessageLabel: UILabel = {
        let v = UILabel()
        v.textColor = UIColor(hexString: "42556B")
        v.text = "Where the events held?"
        v.font = UIFont(name:"Rubik-Regular", size: 14.0)
        return v
    }()
    
    var tapMapView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 8
        v.backgroundColor = .systemGray5
        return v
    }()
    
    let lineBottomBreakView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hexString: "F1F2F5")
        return v
    }()
    
    let priceMessageLabel: UILabel = {
        let v = UILabel()
        v.textColor = UIColor(hexString: "42556B")
        v.text = "Entrance price"
        v.font = UIFont(name:"Rubik-Regular", size: 14.0)
        return v
    }()
    
    var priceLabel: UILabel = {
        let v = UILabel()
        v.text = "$0"
        v.textColor = UIColor(hexString: "080A0D")
        v.font = UIFont(name:"Rubik-Regular", size: 24.0)
        return v
    }()
    
    var plusPriceButton: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "btn-plus"), for: .normal)
        return v
    } ()
    
    var minusPriceButton: UIButton = {
        let v = UIButton()
        v.setImage(UIImage(named: "btn-minus"), for: .normal)
        return v
    }()
    
    lazy var sliderButtonView: MTSlideToOpenView = {
        let slide = MTSlideToOpenView(frame: CGRect(x: 26, y: 200, width: 317, height: 48))
        slide.sliderViewTopDistance = 0
        slide.sliderCornerRadius = 24
        slide.thumnailImageView.backgroundColor  = UIColor(red: 0.678, green: 0.735, blue: 0.802, alpha: 1)
        slide.draggedView.backgroundColor = UIColor(red: 0.678, green: 0.735, blue: 0.802, alpha: 1)
        slide.delegate = self
        slide.thumbnailViewStartingDistance = 17
        slide.textLabel.textAlignment = .right
        slide.textColor = .white
        slide.labelText = "Complete the forms"
        slide.thumnailImageView.image = UIImage(named: "btn-primary")?.imageFlippedForRightToLeftLayoutDirection()
        slide.sliderHolderView.backgroundColor = UIColor(red: 0.678, green: 0.735, blue: 0.802, alpha: 1)
        return slide
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setupViews() {
        self.view.addSubview(self.topView)
        self.setupCreateEventLabel()
        self.setupPerformanceMessageLabel()
        self.view.addSubview(self.contentView)
        self.setupWhenMessageLabel()
        self.setupDateLabel()
        self.setupTimeLabel()
        self.setupPmLabel()
        self.setupAmLabel()
        self.setuplineBreakView()
        self.setupWhereMessageLabel()
        self.setupTapMapView()
        self.setupLineBottomBreakView()
        self.setupPriceMessageLabel()
        self.setupPriceLabel()
        self.setupPlusPriceButton()
        self.setupMinusPriceButton()
        self.setupsliderButtonContainerView()
    }
    
    private func setupCreateEventLabel() {
        self.topView.addSubview(self.createEventLabel)
    }
        
    private func setupPerformanceMessageLabel() {
        self.topView.addSubview(self.performanceMessageLabel)
    }

    private func setupWhenMessageLabel() {
        self.contentView.addSubview(self.whenMessageLabel)
    }
    
    private func setupDateLabel() {
        self.contentView.addSubview(self.dateLabel)
    }
    
    private func setupTimeLabel() {
        self.contentView.addSubview(self.timeLabel)
    }
    
    private func setupPmLabel() {
        self.contentView.addSubview(self.pmLabel)
    }
    private func setupAmLabel() {
        self.contentView.addSubview(self.amLabel)
    }
    
    private func setuplineBreakView() {
        self.contentView.addSubview(lineBreakView)
    }
    
    private func setupWhereMessageLabel() {
        self.contentView.addSubview(self.whereMessageLabel)
    }
    
    private func setupTapMapView() {
        self.contentView.addSubview(self.tapMapView)
    }
    
    private func setupLineBottomBreakView() {
        self.contentView.addSubview(self.lineBottomBreakView)
    }
    
    private func setupPriceMessageLabel() {
        self.contentView.addSubview(self.priceMessageLabel)
    }
    
    private func setupPriceLabel() {
        self.contentView.addSubview(self.priceLabel)
    }
    
    private func setupPlusPriceButton() {
        self.contentView.addSubview(self.plusPriceButton)
    }
    
    private func setupMinusPriceButton() {
        self.contentView.addSubview(self.minusPriceButton)
    }
        
    private func setupsliderButtonContainerView() {
        self.contentView.addSubview(self.sliderButtonView)
    }
    
    
    private func setupConstraints() {
        self.topViewConstraints()
        self.eventLabelConstraints()
        self.performanceMessageLabelConstraints()
        self.contentViewConstraints()
        self.whenMessageLabelConstraints()
        self.dateLabelConstraints()
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
            make.trailing.equalToSuperview()
            make.top.equalTo(self.whenMessageLabel.snp.bottom).offset(12)
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
            make.leading.equalToSuperview().inset(24)
            make.trailing.equalToSuperview().inset(24)
            make.top.equalTo(priceLabel.snp.bottom).offset(76)
        }
    }
}
