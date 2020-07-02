//
//  PeopleViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 14.04.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController {
    
    var collectionView: UICollectionView!
    let myUsers = Bundle.main.decode([MUser].self, from: "users.json")
    enum Section: Int, CaseIterable {
        case users
        func descriptionHeader(peopleCount: Int) -> String {
            switch self {
            case .users:
                return "\(peopleCount) people nearby"
            }
        }
    }
    var dataSource: UICollectionViewDiffableDataSource<Section, MUser>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData(filter: nil)
    }
    
    // MARK: - set up collection view
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        
        //регистрация header
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseID)
        
        //регистрация ячейки
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: UserCell.reuseID)
       // collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        
    }
    private func reloadData(filter: String?) {
        //отфильтрованный массив
        let filtredUsers = myUsers.filter { (user) -> Bool in
            user.contains(filter: filter)
        }
        
        //следит за изменениями данных
        var snapshot = NSDiffableDataSourceSnapshot<Section, MUser>()
        snapshot.appendSections([.users,])
        snapshot.appendItems(filtredUsers, toSection: .users)
        // регистрация снэпшот
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    
}
//MARK: - Composition Layout
extension PeopleViewController {
    private func createCompositionalLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            // section -> group -> item -> size
            
            guard let section = Section(rawValue: sectionIndex) else {fatalError("не удалось извлечь секцию ")}
            switch section {
            case .users:
                return self.createUsers()
            }
            
        }
        //расстояние между секциями
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
        layout.configuration = config
        return layout
    }
    
    
    private func createUsers() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.6))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

//MARK: - Data source
extension PeopleViewController {

    private func createDataSource() {
        
          dataSource = UICollectionViewDiffableDataSource<Section, MUser> (collectionView: collectionView, cellProvider: { (collectionView, indexPath, user) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {fatalError("не удалось извлечь секцию ")}
            switch section {
            case .users:
                return self.configureCell(collectionView: collectionView, cellType: UserCell.self, with: user, for: indexPath)
              //  return self.configureCell(with: user, for: indexPath)
               // return self.configureCell(cellType: UserCell, with: MUser, for: indexPath)
            }
        })
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexpath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseID, for: indexpath) as? SectionHeader else { fatalError("Can't create new section header")}
            guard  let section = Section(rawValue: indexpath.section) else {fatalError("can't create section")}
            //объекты в секции
            let items = self.dataSource?.snapshot().itemIdentifiers(inSection: .users)
            
            sectionHeader.configure(titleText: section.descriptionHeader(peopleCount: items!.count) , font: .avenir26(), color: .black)
            return sectionHeader
        }
    }}



//MARK: - Search bar
extension PeopleViewController {
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
        reloadData(filter: searchText)
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

