//
//  UIImageView + Extension.swift
//  ChatApp
//
//  Created by Manager on 26/03/2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: ContentMode) {
        
        self.init()
        self.image = image
        self.contentMode = contentMode
        
    }
    
}
