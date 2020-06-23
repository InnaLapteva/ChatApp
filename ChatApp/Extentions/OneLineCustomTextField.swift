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
           
           var bottomView = UIView()
           bottomView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
           bottomView.backgroundColor = .textFieldLight()
           bottomView.translatesAutoresizingMaskIntoConstraints = false
           self.addSubview(bottomView)
           
           NSLayoutConstraint.activate([
               bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
               bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
               bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
               bottomView.heightAnchor.constraint(equalToConstant: 1)
           ])
       }
    
}
