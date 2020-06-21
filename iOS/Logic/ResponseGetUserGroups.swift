//
//  ResponseGetUserGroups.swift
//  iOS
//
//  Created by Лолита on 21.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
//https://api.vk.com//method/groups.get?order=name&count=3&v=5.103&access_token=6c78a9a92f0c2853b76d219bad6bb83524b7637540784c2f89e4ee2cdc9b33983e7e58d327e24a7eb85e1&extended=1
class VKResponseUserGroupsGet: Decodable {
   let response: UserGroupsGet
}
class UserGroupsGet: Decodable {
   let items: [GroupsList]
}
class GroupsList: Object, Decodable {
   @objc dynamic var members_count: Int
   @objc dynamic var id: Int
   @objc dynamic var name: String
   @objc dynamic var type: String
   @objc dynamic var photo_50: String
    
}

