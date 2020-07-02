//
//  UserCell.swift
//  ChatApp
//
//  Created by Инна Лаптева on 23.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell, SelfConfigurationCell {
    
    static var reuseID: String = "UserCell"
    
    let image = UIImageView()
    let nameLabel = UILabel()
    let container = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraints()
        self.backgroundColor = .white
        self.layer.shadowColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.cornerRadius = 4
    }
    override func layoutSubviews() {
        super.layoutSubviews()
          container.layer.cornerRadius = 4
              container.clipsToBounds = true
    }
    
    
    func configure<U>(with value: U) where U : Hashable {
          guard let user: MUser = value as? MUser else { return }
          image.image = UIImage(named: user.avatarStringURL)
          nameLabel.text = user.username
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension UserCell {
    private func setUpConstraints() {
        
        image.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(container)
        container.addSubview(image)
        container.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            image.topAnchor.constraint(equalTo: container.topAnchor),
            image.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            image.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            image.heightAnchor.constraint(equalTo: container.widthAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10)
        ])
        
    }
    
}
// MARK: - SwiftUI
import SwiftUI

struct UserProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<UserProvider.ContainerView>) -> MainTabBarViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: UserProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserProvider.ContainerView>) {
            
        }
    }
}
