//
//  AddPhotoView.swift
//  ChatApp
//
//  Created by Инна Лаптева on 13.04.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class AddPhotoView: UIView {
    
    var circleImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "avatar")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = #imageLiteral(resourceName: "plus")
        button.setImage(buttonImage, for: .normal)
        button.tintColor = .buttonBlack()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(circleImageView)
        addSubview(plusButton)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
        circleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
        circleImageView.heightAnchor.constraint(equalToConstant: 110),
        circleImageView.widthAnchor.constraint(equalToConstant: 110),
        
        plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
        plusButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 2),
        plusButton.heightAnchor.constraint(equalToConstant: 30),
        plusButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        self.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor).isActive = true
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.height / 2
    }
    
}
