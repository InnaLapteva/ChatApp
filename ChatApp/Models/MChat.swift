//
//  MChat.swift
//  ChatApp
//
//  Created by Инна Лаптева on 23.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

struct MChat: Hashable, Decodable {
    var userName: String
    var userImageString: String
    var lastMessage:String
    var id:  Int
    
    func hash(info hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}
