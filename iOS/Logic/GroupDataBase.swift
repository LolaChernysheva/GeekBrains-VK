//
//  FriendDataBase.swift
//  iOS
//
//  Created by Лолита Чернышева on 12.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation

class GroupDataBase {
    var userGroups: [Group] = [
            Group(name: "GeekBrains", numberOfUsers: 5000),
            Group(name: "PiterOnline", numberOfUsers: 2500),
            Group(name: "Picabu", numberOfUsers: 1500)
    ]
    var searchGroups: [Group] = [
            Group(name: "Java", numberOfUsers: 1),
            Group(name: "HTML", numberOfUsers: 1),
            Group(name: "CSS", numberOfUsers: 1),
            Group(name: "Eerl Grey", numberOfUsers: 1),
            Group(name: "Milky Olong", numberOfUsers: 1),
            Group(name: "RunPotatos!", numberOfUsers: 1),
    ]
    
    //создадим singleton
   static let shared = GroupDataBase()
    //блокируем возможность создания экземпляров класса из других мест программы
    private init () {
    }
}
