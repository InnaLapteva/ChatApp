//
//  ViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 25.03.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    var button: UIButton = {
        let button = UIButton()
        return button
    }()
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get Started with")
    let emailleLabel = UILabel(text: "Or signup with")
    let alreadyOnBoardLabel = UILabel(text: "Already onboard?")
    
    let googleButton = UIButton(backgroundColor: .white, titleColor: .black, title: "Google", isShadow: true)
    let emailButton = UIButton(backgroundColor: .darkGray, titleColor: .white, title: "Email")
    let loginButton = UIButton(backgroundColor: .white, titleColor: .buttonRed(), title: "Login", isShadow: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setUpConstraints()
    }
    
   
}

//MARK: Setup constraints

extension AuthViewController {
    //верстка экрана
       private func setUpConstraints() {
           logoImageView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(logoImageView)
           logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
           logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
           
           let googleView = ButtonFormView(label: googleLabel, button: googleButton)
           let emailView = ButtonFormView(label: emailleLabel, button: emailButton)
           let loginView = ButtonFormView(label: alreadyOnBoardLabel, button: loginButton)
           
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView],
                                       axis: .vertical,
                                       spacing: 40)
           view.addSubview(stackView)
           stackView.translatesAutoresizingMaskIntoConstraints = false

           NSLayoutConstraint.activate(
           [stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
           stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
           stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)])
           
       }
}


//MARK: SwiftUI
import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
}

struct ContainerView: UIViewControllerRepresentable {
    
    let viewController = AuthViewController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ContainerView>) -> AuthViewController {
        return viewController
    }
    func updateUIViewController(_ uiViewController: ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ContainerView>) {
        
    }
    
}
