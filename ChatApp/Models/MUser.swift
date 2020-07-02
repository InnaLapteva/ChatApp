//
//  User.swift
//  ChatApp
//
//  Created by Инна Лаптева on 23.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

struct MUser: Decodable, Hashable {
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(info hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    //фильтрация пользователей
    func contains(filter: String?) -> Bool {
        
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
        
    }
}
