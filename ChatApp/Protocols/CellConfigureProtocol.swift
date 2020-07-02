//
//  CellConfigureProtocol.swift
//  ChatApp
//
//  Created by Инна Лаптева on 17.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import Foundation

protocol SelfConfigurationCell {
    static var reuseID: String { get }
    func configure<U: Hashable>(with value: U)
}
