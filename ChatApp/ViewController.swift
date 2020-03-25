//
//  ViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 25.03.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
    
    let viewController = ViewController()
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ContainerView>) -> ViewController {
        return viewController
    }
    func updateUIViewController(_ uiViewController: ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ContainerView>) {
        
    }
    
}
