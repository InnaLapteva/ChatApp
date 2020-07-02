//
//  ListViewController.swift
//  ChatApp
//
//  Created by Инна Лаптева on 14.04.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit



class ListViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")
    
    
    enum Section: Int, CaseIterable {
       case waitingChats
        case activeChats
        
        func description() -> String {
            switch self {
            case .waitingChats:
                return "Waiting chats"
            case .activeChats:
               return "Active chats"
            }
        }
    }
    
  var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainWhite()
        setUpSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData()
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
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        
        //регистрация header
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseID)

        //регистрация ячейки
        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseID)
        collectionView.register(WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuseID)
    }
    
    private func reloadData() {
        //следит за изменениями данных
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.waitingChats, .activeChats])
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        snapshot.appendItems(activeChats, toSection: .activeChats)
        // регистрация снэпшот
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
   
}
//MARK: - composition layout
extension ListViewController {
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat> (collectionView: collectionView, cellProvider: { (colectionView, indexPath, chat) -> UICollectionViewCell? in
            
            guard let section = Section(rawValue: indexPath.section) else {fatalError("не удалось извлечь секцию ")}
            
            switch section {
            case .waitingChats:
                return self.configureCell(collectionView: self.collectionView, cellType: WaitingChatCell.self, with: chat, for: indexPath)
//                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "cellid2" , for: indexPath)
//                cell.backgroundColor = .green
//                return cell
            case .activeChats:
                return self.configureCell(collectionView: self.collectionView, cellType: ActiveChatCell.self, with: chat, for: indexPath)
            }
        })
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexpath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseID, for: indexpath) as? SectionHeader else { fatalError("Can't create new section header")}
            guard  let section = Section(rawValue: indexpath.section) else {fatalError("can't create section")}
            
            sectionHeader.configure(titleText: section.description() , font: .laoSangamMN20(), color: .textFieldLight())
            return sectionHeader
        }
    }}

// MARK: - setup layout
extension ListViewController {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            // section -> group -> item -> size
            
            guard let section = Section(rawValue: sectionIndex) else {fatalError("не удалось извлечь секцию ")}
            switch section {
            case .waitingChats:
                return self.createWaitingChats()
            case .activeChats:
                return self.createActiveChats()
            }
            
        }
        //расстояние между секциями
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
        layout.configuration = config
        return layout
    }
    
    
    private func createActiveChats() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(78))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20)
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    private func createWaitingChats() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88),
                                               heightDimension: .absolute(88))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior =  .continuous
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 0, trailing: 20)
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]
        return section
        
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
//extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
//        cell.backgroundColor = .red
//        cell.layer.borderWidth = 1
//        return cell
//    }
//}


// MARK: - UISearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print(searchText)
    }
}


// MARK: - SwiftUI
import SwiftUI

struct ListVC: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let tabBarVC = MainTabBarViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListVC.ContainerView>) -> MainTabBarViewController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ListVC.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListVC.ContainerView>) {
            
        }
    }
}
