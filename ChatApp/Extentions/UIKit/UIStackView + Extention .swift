//
//  UIStackView + Extention .swift
//  ChatApp
//
//  Created by Инна Лаптева on 27.03.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
    
}

