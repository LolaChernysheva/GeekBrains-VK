//
//  ResponseFriendsGet.swift
//  iOS
//
//  Created by Лолита on 21.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import Alamofire
//https://api.vk.com//method/friends.get?order=name&count=3&fields=nickname,domain,sex,bdate,city&name_case=ins&v=5.103&access_token=6c78a9a92f0c2853b76d219bad6bb83524b7637540784c2f89e4ee2cdc9b33983e7e58d327e24a7eb85e1
struct VKResponseFriendsGet: Decodable {
    let response: Items
}
struct Items: Decodable {
    let items: [FriendsList]
}
struct FriendsList: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let sex: Int
    let nickname: String?
    let city: City?
    let online: Int
    let photo_50: String
}
struct City: Decodable {
    let id: Int
    let title: String
}

