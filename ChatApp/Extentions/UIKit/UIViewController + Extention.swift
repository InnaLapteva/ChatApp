//
//  UIViewController + Extention.swift
//  ChatApp
//
//  Created by Инна Лаптева on 25.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // функция для конфигурации ячейки
    func configureCell<T: SelfConfigurationCell, U: Hashable>(collectionView: UICollectionView, cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else { fatalError() }
        cell.configure(with: value)
        return cell
    }
}
