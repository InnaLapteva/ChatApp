//
//  UIButton + Extention.swift
//  ChatApp
//
//  Created by Инна Лаптева on 25.03.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(backgroundColor: UIColor,
                     titleColor: UIColor,
                     title: String,
                     cornerDadius: CGFloat = 4,
                     isShadow: Bool = false,
                     font: UIFont? = .avenir20()) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerDadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
    }
    
    func customizeGoogleButton() {
        
        let googleLogo = UIImageView(image: #imageLiteral(resourceName: "googleLogo"), contentMode: .scaleAspectFit)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 5).isActive = true
        googleLogo.centerYAnchor.constraint(equalToSystemSpacingBelow: self.centerYAnchor, multiplier: 0).isActive = true
    }
    
}
