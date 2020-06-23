//
//  PeopleViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 14.04.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    

     private func setUpSearchBar() {
            navigationController?.navigationBar.barTintColor = .mainWhite()
            navigationController?.navigationBar.shadowImage = UIImage()
            
            let searchController = UISearchController(searchResultsController: nil)
            navigationItem.searchController = searchController
            
            navigationItem.hidesSearchBarWhenScrolling = false
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.obscuresBackgroundDuringPresentation = false
            //делегат
            searchController.searchBar.delegate = self
        }
        
    }

    // MARK: - UISearchBarDelegate
    extension PeopleViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print(searchText)
        }
    }
// MARK: - SwiftUI
import SwiftUI

struct PeopleVC: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PeopleVC.ContainerView>) -> MainTabBarViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: PeopleVC.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PeopleVC.ContainerView>) {
            
        }
    }
}

