//
//  ActiveChatCell.swift
//  ChatApp
//
//  Created by Инна Лаптева on 18.04.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class ActiveChatCell: UICollectionViewCell, SelfConfigurationCell  {
    static var reuseID: String = "ActiveChatCell"
    
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User Name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
    let gradientView = GradientView(from: .topLeading, to: .bottomTrailing, startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1) , endColor: #colorLiteral(red: 0.3333926499, green: 0.6381108165, blue: 0.9452508092, alpha: 1))
    
    func configure(with value: MChat) {
        
        friendImageView.image = UIImage(named: value.userImageString)
        friendName.text = value.userName
        lastMessage.text = value.lastMessage
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        setUpConstraints()
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - set up constraints
extension ActiveChatCell {
    private func setUpConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendImageView.backgroundColor = .darkGray
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(friendImageView)
        addSubview(friendName)
        addSubview(lastMessage)
        addSubview(gradientView)
        
        //constraint для элементов ячейки
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.widthAnchor.constraint(equalToConstant: 78),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            
            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
            friendName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 10),
            
            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
            lastMessage.topAnchor.constraint(equalTo: friendName.bottomAnchor, constant: 5),
            lastMessage.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 10),
            
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 10),
            gradientView.topAnchor.constraint(equalTo: self.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
}

// MARK: - SwiftUI
import SwiftUI

struct ActiveChatProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ActiveChatProvider.ContainerView>) -> MainTabBarViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ActiveChatProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ActiveChatProvider.ContainerView>) {
            
        }
    }
}
