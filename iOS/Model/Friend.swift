//
//  User.swift
//  iOS
//
//  Created by Лолита Чернышева on 24.12.2019.
//  Copyright © 2019 Лолита Чернышева. All rights reserved.
//
import Foundation
class Friend {
    var name: String = ""
    var surname: String = ""
    var age: Int = 0
    var gender: String = ""
    var isOnline: Bool = false
    var avatarPath: String = ""
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatarPath = avatar
    }
    init() {
    }
    
}
