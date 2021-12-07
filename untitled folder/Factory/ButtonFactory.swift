//
//  IButtonFactory.swift
//  googlMapTutuorial2
//
//  Created by Андрей Дорофеев on 03.09.2021.
//  Copyright © 2021 akhil. All rights reserved.
//

import Foundation
import UIKit

enum ButtonType {
    case favorite, artist, event, addevent
}

class ButtonFactory {
    
    static var shared = ButtonFactory()
    
    let titleEdgeInset = UIEdgeInsets(top: 9, left: 9.33, bottom: 9, right: 12)
    
    func getButton(_ buttonType: ButtonType) -> UIButton {
        switch buttonType {
            
        case .favorite:
            let v = UIButton()
            v.clipsToBounds = true
            v.layer.cornerRadius = 16
            v.setImage(UIImage(named: "favorite"), for: .normal)
            v.imageView?.contentMode = .scaleAspectFit
            v.setBackgroundColor(color: .white, forState: .normal)
            v.setTitle("My Favorite", for: .normal)
            v.setTitleColor(UIColor(hexString: "42556B"), for: .normal)
            v.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 12.0)
            v.titleEdgeInsets = self.titleEdgeInset
            v.imageEdgeInsets = UIEdgeInsets(top: 10.1, left: 13.31, bottom: 10.7, right: 95.34)
            return v
        
        case .artist:
            let v = UIButton()
            v.clipsToBounds = true
            v.layer.cornerRadius = 16
            v.setImage(UIImage(named: "artist"), for: .normal)
            v.imageView?.contentMode = .scaleAspectFit
            v.setBackgroundColor(color: .white, forState: .normal)
            v.setTitle(" Join as Artist", for: .normal)
            v.setTitleColor(UIColor(hexString: "42556B"), for: .normal)
            v.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 12.0)
            v.titleEdgeInsets = self.titleEdgeInset
            v.imageEdgeInsets = UIEdgeInsets(top: 9.33, left: 13.33, bottom: 9.33, right: 95.33)
            return v
            
        case .event:
            let v = UIButton()
            v.clipsToBounds = true
            v.layer.cornerRadius = 16
            v.setImage(UIImage(named: "event"), for: .normal)
            v.imageView?.contentMode = .scaleAspectFit
            v.setBackgroundColor(color: .white, forState: .normal)
            v.setTitle(" My Events", for: .normal)
            v.setTitleColor(UIColor(hexString: "42556B"), for: .normal)
            v.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 12.0)
            v.titleEdgeInsets = self.titleEdgeInset
            v.imageEdgeInsets = UIEdgeInsets(top: 9.33, left: 15.33, bottom: 9.33, right: 81.33)
            return v
            
        case .addevent:
            let v = UIButton()
            v.clipsToBounds = true
            v.layer.cornerRadius = 20
            v.setImage(UIImage(named: "addevent"), for: .normal)
            v.imageView?.contentMode = .scaleAspectFit
            v.setBackgroundColor(color: UIColor(hexString: "25A0F2"), forState: .normal)
            v.imageEdgeInsets = UIEdgeInsets(top: 8.0, left: 24.0, bottom: 8.0, right: 24.0)
            return v
        }
    }
}
