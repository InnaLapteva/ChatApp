//
//  UISegmentedControl + Extention.swift
//  ChatApp
//
//  Created by Инна Лаптева on 14.04.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

extension UISegmentedControl {
    
    convenience init(firstItem: String, secondItem: String) {
        self.init()
        self.insertSegment(withTitle: firstItem, at: 0, animated: true)
        self.insertSegment(withTitle: secondItem, at: 1, animated: true)
        self.selectedSegmentIndex = 0 
    }
}
