//
//  OneLineCustomTextField.swift
//  ChatApp
//
//  Created by Manager on 27/03/2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class OneLineCustomTextField: UITextField {
    
    convenience init(font: UIFont? = .avenir20()) {
        self.init()
        
        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        bottomView.backgroundColor = .textFieldLight()
        self.addSubview(bottomView)
        
        //constraints
        
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
    
}
