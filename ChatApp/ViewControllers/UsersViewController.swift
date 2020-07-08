//
//  UsersViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 23.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

     var collectionView: UICollectionView!
    let users = Bundle.main.decode([User].self, from: "user.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}
// MARK: - SwiftUI
import SwiftUI

struct UserVC: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<UserVC.ContainerView>) -> MainTabBarViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: UserVC.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<UserVC.ContainerView>) {
            
        }
    }
}
