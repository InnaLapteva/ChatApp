//
//  SectionHeader.swift
//  ChatApp
//
//  Created by Инна Лаптева on 23.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class SectionHeader : UICollectionReusableView {
    
    static let reuseID = "SectionHeader"
    
    let tittle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tittle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tittle)
        NSLayoutConstraint.activate([
            tittle.topAnchor.constraint(equalTo: self.topAnchor),
            tittle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tittle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tittle.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    func configure(titleText: String, font: UIFont?, color: UIColor) {
        tittle.text = titleText
        tittle.font = font
        tittle.textColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
