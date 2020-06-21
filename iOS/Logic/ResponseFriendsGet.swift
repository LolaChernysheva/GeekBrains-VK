//
//  ResponseFriendsGet.swift
//  iOS
//
//  Created by Лолита on 21.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
//https://api.vk.com//method/friends.get?order=name&count=3&fields=nickname,domain,sex,bdate,city&name_case=ins&v=5.103&access_token=6c78a9a92f0c2853b76d219bad6bb83524b7637540784c2f89e4ee2cdc9b33983e7e58d327e24a7eb85e1
class VKResponseFriendsGet: Decodable {
   let response: Items
}
class Items:  Decodable {
   let items: [FriendsList]
}
class FriendsList: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var first_name: String = ""
    @objc dynamic var last_name: String = ""
    @objc dynamic var sex: Int = 0
    @objc dynamic var nickname: String = ""
   // @objc dynamic let city: City?
    @objc dynamic var online: Int = 0
    @objc dynamic var photo_50: String = ""
}
class City: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var title: String
}

