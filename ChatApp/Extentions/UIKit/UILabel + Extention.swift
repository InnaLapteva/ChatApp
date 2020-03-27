//
//  UILabel + Extention.swift
//  ChatApp
//
//  Created by Manager on 26/03/2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        self.text = text
        self.font = font
    }
}
