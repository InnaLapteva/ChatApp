//
//  ProfileViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 26.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}

//MARK: SwiftUI
import SwiftUI

struct ProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let profileVC = ProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ProfileVCProvider.ContainerView>) -> ProfileViewController {
            return profileVC
        }
        
        func updateUIViewController(_ uiViewController: ProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ProfileVCProvider.ContainerView>) {
            
        }
    }
}
