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
            Group(name: "GeekBrains", numberOfUsers: 5000, groupAvatar: ""),
            Group(name: "PiterOnline", numberOfUsers: 2500, groupAvatar: ""),
            Group(name: "Picabu", numberOfUsers: 1500, groupAvatar: "")
    ]
    var searchGroups: [Group] = [
        Group(name: "Java", numberOfUsers: 1, groupAvatar: ""),
            Group(name: "HTML", numberOfUsers: 1, groupAvatar: ""),
            Group(name: "CSS", numberOfUsers: 1,  groupAvatar: ""),
            Group(name: "Eerl Grey", numberOfUsers: 1,  groupAvatar: ""),
            Group(name: "Milky Olong", numberOfUsers: 1,  groupAvatar: ""),
            Group(name: "RunPotatos!", numberOfUsers: 1,  groupAvatar: ""),
    ]
    
    //создадим singleton
   static let shared = GroupDataBase()
    //блокируем возможность создания экземпляров класса из других мест программы
    private init () {
    }
}
