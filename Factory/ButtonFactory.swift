//
//  IButtonFactory.swift
//  googlMapTutuorial2
//
//  Created by Андрей Дорофеев on 03.09.2021.
//  Copyright © 2021 akhil. All rights reserved.
//

import Foundation
import UIKit

class ButtonFactory: UIButton {
    
    static let customTitleEdgeInset = UIEdgeInsets(top: 9, left: 9.33, bottom: 9, right: 12)
    
    open class var favorite: UIButton {
        let v = UIButton()
        v.clipsToBounds = true
        v.layer.cornerRadius = 16
        v.setImage(UIImage(named: "favorite_icon"), for: .normal)
        v.imageView?.contentMode = .scaleAspectFit
        v.setBackgroundColor(color: .white, forState: .normal)
        v.setTitle("My Favorite", for: .normal)
        v.setTitleColor(.customDarkBlue, for: .normal)
        v.titleLabel?.font = .fontRubikSize(12)
        v.titleEdgeInsets = customTitleEdgeInset
        v.imageEdgeInsets = UIEdgeInsets(top: 10.1, left: 13.31, bottom: 10.7, right: 95.34)
        return v
    }
    
    open class var artist: UIButton {
        let v = UIButton()
        v.clipsToBounds = true
        v.layer.cornerRadius = 16
        v.setImage(UIImage(named: "artist_icon"), for: .normal)
        v.imageView?.contentMode = .scaleAspectFit
        v.setBackgroundColor(color: .white, forState: .normal)
        v.setTitle(" Join as Artist", for: .normal)
        v.setTitleColor(.customDarkBlue, for: .normal)
        v.titleLabel?.font = .fontRubikSize(12)
        v.titleEdgeInsets = self.customTitleEdgeInset
        v.imageEdgeInsets = UIEdgeInsets(top: 9.33, left: 13.33, bottom: 9.33, right: 95.33)
        return v
    }
    
    open class var event: UIButton {
        let v = UIButton()
        v.clipsToBounds = true
        v.layer.cornerRadius = 16
        v.setImage(UIImage(named: "events_icon"), for: .normal)
        v.imageView?.contentMode = .scaleAspectFit
        v.setBackgroundColor(color: .white, forState: .normal)
        v.setTitle(" My Events", for: .normal)
        v.setTitleColor(.customDarkBlue, for: .normal)
        v.titleLabel?.font = .fontRubikSize(12)
        v.titleEdgeInsets = self.customTitleEdgeInset
        v.imageEdgeInsets = UIEdgeInsets(top: 9.33, left: 15.33, bottom: 9.33, right: 81.33)
        return v
    }
    
    open class var addEvent: UIButton {
        let v = UIButton()
        v.clipsToBounds = true
        v.layer.cornerRadius = 20
        v.setImage(UIImage(named: "addevent_icon"), for: .normal)
        v.imageView?.contentMode = .scaleAspectFit
        v.setBackgroundColor(color: .customBlue, forState: .normal)
        v.imageEdgeInsets = UIEdgeInsets(top: 8.0, left: 24.0, bottom: 8.0, right: 24.0)
        return v
    }
    
    open class var close: UIButton {
        let v = UIButton()
        v.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .medium)
        let image = UIImage(systemName: "xmark", withConfiguration: configuration)
        v.setImage(image, for: .normal)
        v.tintColor = .white
        v.contentMode = .scaleAspectFill
        v.isUserInteractionEnabled = true
        v.isAccessibilityElement = true
        v.accessibilityLabel = "Close Picker"
        return v
    }
    
    open class var share: UIButton {
        let v = UIButton()
        v.clipsToBounds = true
        v.layer.cornerRadius = 24
        v.setImage(UIImage(named: "share"), for: .normal)
        v.imageView?.contentMode = .scaleAspectFill
        return v
    }
    
    open class var seeEventListButton: UIButton {
        let v = UIButton()
        v.clipsToBounds = true
        v.layer.cornerRadius = 24
        v.setBackgroundColor(color: .customBlue, forState: .normal)
        v.setTitle("See Event List", for: .normal)
        v.titleLabel?.font = .fontRubikSize(14)
        v.tintColor = .purple
        return v
    }
    
    open class var signInButton: UIButton {
        let v = UIButton()
        v.backgroundColor = .customBlue
        v.layer.cornerRadius = 24
        v.titleLabel?.font =  UIFont(name: "Rubik-Medium", size: 14)
        v.setTitle("Sign In", for: .normal)
        return v
    }
    
    open class var signUpButton: UIButton {
        let v = UIButton()
        v.backgroundColor = .customBlue
        v.layer.cornerRadius = 24
        v.titleLabel?.font =  UIFont(name: "Rubik-Medium", size: 14)
        v.setTitle("Sign Up", for: .normal)
        return v
    }
    open class var secondaryButton: UIButton {
        let v = UIButton()
        v.titleLabel?.font = UIFont(name:"Rubik-Regular", size: 14.00)
        v.setTitleColor(.customBlue, for: .normal)
        v.setTitleColor(.lightGray, for: .highlighted)
        return v
    }
}
