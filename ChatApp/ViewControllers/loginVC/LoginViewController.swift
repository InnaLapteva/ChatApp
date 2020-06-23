//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 27.03.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    let welcomeLabel = UILabel(text: "Welcom back!", font: .avenir26())
    let loginWithLabel = UILabel(text: "Login with", font: .avenir20())
    let orLabel = UILabel(text: "or", font: .avenir20())
    let emailLabel = UILabel(text: "Email", font: .avenir20())
    let passwordLabel = UILabel(text: "Login with", font: .avenir20())
    let needAccountLabel = UILabel(text: "Need an account?", font: .avenir20())
    
    
    let googleButton = UIButton(backgroundColor: .white,
                                titleColor: .black,
                                title: "Google",
                                isShadow: true)
    let loginButton = UIButton(backgroundColor: .buttonBlack(),
                               titleColor: .buttonWhite(),
                               title: "Login",
                               cornerDadius: 4)
    let signInButton =  UIButton(backgroundColor: .buttonWhite(),
                                 titleColor: .buttonRed(),
                                 title: "Sign In",
                                 cornerDadius: 4)
    
    let emailTextField = OneLineCustomTextField(font: .avenir20())
    let passwordTextField = OneLineCustomTextField(font: .avenir20())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setUpConstraints()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


// MARK: - extention

extension LoginViewController {
    
    private func setUpConstraints() {
        
        let loginWithView = ButtonFormView(label: loginWithLabel, button: googleButton)
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [loginWithView,
                                                       orLabel,
                                                       emailStackView,
                                                       passwordStackView,
                                                       loginButton],
                                    axis: .vertical,
                                    spacing: 40)
        
        signInButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [needAccountLabel, signInButton], axis: .horizontal , spacing: 10)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(welcomeLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
         NSLayoutConstraint.activate([
         
            welcomeLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 20),
            welcomeLabel.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0),
            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
           
            
         ])
    }
    
}

// MARK: - SwiftUI
import SwiftUI

struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let loginVC = LoginViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) -> LoginViewController {
            return loginVC
        }
        
        func updateUIViewController(_ uiViewController: LoginVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) {
            
        }
    }
}
