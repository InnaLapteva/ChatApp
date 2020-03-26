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
    
    //let myButton = UIButton(backgroundColor: .white, titleColor: .black, title: "Email", cornerDadius: 10, isShadow: true, font: UIFont()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
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
