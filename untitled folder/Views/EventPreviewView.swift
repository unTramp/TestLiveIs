//
//  RestaurantPreviewView.swift
//  googlMapTutuorial2
//
//  Created by Muskan on 12/17/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import MarqueeLabel

class EventPreviewView: UIView {
    
    let contentView: UIView = {
        let v=UIView()
        v.backgroundColor = .black
        v.layer.cornerRadius = 12
        return v
    }()
    
    let playButton: UIButton = {
        let v=UIButton()
        v.clipsToBounds = true
        v.setImage(UIImage(named: "play_circle"), for: .normal)
        return v
    }()
    
    let smallPlayImageView: UIImageView = {
        let v = UIImageView()
        v.clipsToBounds = true
        v.image = UIImage(named: "playButtonSmall")
        v.layer.cornerRadius = 10
        return v
    } ()
    
    let songNameLabel: MarqueeLabel = {
        let v = MarqueeLabel()
        v.type = .continuous
        v.fadeLength = 10
        v.font = UIFont(name: "Rubik-Medium", size: 14)
        v.text = "Some song name"
        v.textColor = .white
        return v
    }()
    
    let bandNameLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont(name: "Rubik-Regular", size: 10)
        v.text = "Some band name"
        v.textColor = UIColor(hexString: "9CA9B8")
        return v
    }()
    
    let progressView: UIProgressView = {
        let v = UIProgressView(progressViewStyle: .bar)
        v.translatesAutoresizingMaskIntoConstraints=false
        v.trackTintColor = UIColor(red: 0.945, green: 0.949, blue: 0.961, alpha: 1)
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 2
        v.progressTintColor = UIColor(red: 0.145, green: 0.627, blue: 0.949, alpha: 1)
        v.progress = 0
        return v
    }()
    
    let triangleLable: UILabel = {
        let v = UILabel()
        v.textColor = .black
        v.font = UIFont(name: "Rubik-Medium", size: 14)
        v.text = "▼"
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.selfCorrection()
        self.setupViews()
        self.setupConstraints()
    }
    
    private func selfCorrection() {
        self.backgroundColor = UIColor.clear
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 16
        self.layer.shadowColor = UIColor(red: 0.08, green: 0.139, blue: 0.254, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
    }
    
    private func setupViews() {
        self.addSubview(self.contentView)
        self.contentView.addSubview(self.playButton)
        self.contentView.addSubview(self.songNameLabel)
        self.contentView.addSubview(self.bandNameLabel)
        self.contentView.addSubview(self.progressView)
        self.addSubview(self.triangleLable)
    }

    private func setupConstraints() {
        self.contentViewConstraints()
        self.playButtonConstraints()
        self.songNameLabelConstraints()
        self.bandNameLabelConstraints()
        self.progressViewConstraints()
        self.triangleLabelConstraints()
    }

    private func contentViewConstraints() {
        self.contentView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(72)
        }
    }
    
    private func playButtonConstraints() {
        self.playButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(12)
            make.height.equalTo(48)
            make.width.equalTo(48)
        }
    }
    private func songNameLabelConstraints() {
        self.songNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.playButton.snp.trailing).offset(12)
            make.top.equalToSuperview().inset(12)
            make.trailing.equalToSuperview().inset(12)
            make.height.equalTo(17)
        }
    }
    
    private func bandNameLabelConstraints() {
        self.bandNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.songNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.playButton.snp.trailing).offset(12)
            make.trailing.equalToSuperview().inset(12)
            make.height.equalTo(12)
        }
    }
    
    private func progressViewConstraints() {
        self.progressView.snp.makeConstraints { make in
            make.centerX.equalTo(self.songNameLabel.snp.centerX)
            make.leading.equalTo(self.songNameLabel.snp.leading).offset(4)
            make.trailing.equalTo(self.songNameLabel.snp.trailing).inset(36)
            make.top.equalTo(self.bandNameLabel.snp.bottom).offset(12)
        }
    }
    
    private func triangleLabelConstraints() {
        self.triangleLable.snp.makeConstraints { make in
            make.top.equalTo(self.contentView.snp.bottom).offset(-2)
            make.centerX.equalToSuperview()
            make.height.equalTo(14)
        }
    }
    
    
    func runProgress() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if self.progressView.progress < 1 {
                self.progressView.progress += 0.05
            } else {
                self.progressView.progress = 0
                timer.invalidate()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
