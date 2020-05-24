//
//  ResponseGetUserGroups.swift
//  iOS
//
//  Created by Лолита on 21.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import Alamofire
//https://api.vk.com//method/groups.get?order=name&count=3&v=5.103&access_token=6c78a9a92f0c2853b76d219bad6bb83524b7637540784c2f89e4ee2cdc9b33983e7e58d327e24a7eb85e1&extended=1
struct VKResponseUserGroupsGet: Decodable {
    let response: UserGroupsGet
}
struct UserGroupsGet: Decodable {
    let items: [GroupsList]
}
struct GroupsList: Decodable {
    let members_count: Int?
    let id: Int
    let name: String
    let type: String
    let photo_50: String
    
}

