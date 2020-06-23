//
//  SetUpProfileViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 13.04.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class SetUpProfileViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Set Up Profile", font: .avenir26())
    let fullImageView = AddPhotoView()
    let fullNameLabel = UILabel(text: "Full name", font: .avenir20())
    let aboutMeLabel = UILabel(text: "About me", font: .avenir20())
    let sexLabel = UILabel(text: "Sex", font: .avenir20())
    
    let fullNameTextField = OneLineCustomTextField(font: .avenir20())
    let aboutMeTextField = OneLineCustomTextField(font: .avenir20())
    
    let sexSegmetedControl = UISegmentedControl(firstItem: "Male", secondItem: "Female")
    
    let goToChatsButton = UIButton(backgroundColor: .buttonBlack(),
                                   titleColor: .buttonWhite(),
                                   title: "Go to Chats!",
                                   cornerDadius: 4,
                                   isShadow: false,
                                   font: .avenir20())

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraints()
        
    }
    
}
// MARK: - extention

extension SetUpProfileViewController {
    private func setUpConstraints() {
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        goToChatsButton.translatesAutoresizingMaskIntoConstraints = false
        
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 10)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 10)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmetedControl], axis: .vertical, spacing: 25)
        
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView, aboutMeStackView, sexStackView], axis: .vertical, spacing: 20)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(fullImageView)
        view.addSubview(stackView)
        view.addSubview(goToChatsButton)
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            goToChatsButton.heightAnchor.constraint(equalToConstant: 60),
            goToChatsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            goToChatsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            goToChatsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
}

// MARK: - SwiftUI
import SwiftUI

struct SetUpProfileVC: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let SetUpProfilenVC = SetUpProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetUpProfileVC.ContainerView>) -> SetUpProfileViewController {
            return SetUpProfilenVC
        }
        
        func updateUIViewController(_ uiViewController: SetUpProfileVC.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetUpProfileVC.ContainerView>) {
            
        }
    }
}

