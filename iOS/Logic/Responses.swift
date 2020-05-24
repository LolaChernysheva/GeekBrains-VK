//
//  Responses.swift
//  iOS
//
//  Created by Лолита on 21.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import Alamofire

struct VKResponse: Decodable {
    let response: Response
    
}
//https://api.vk.com/method/groups.search?v=5.103&access_token=d63d0298ece8d218b0ca0b5db757d848b508d2986b74569e34d28b904be9b4cd2d75cffa8a2b9d3a74bf9&q=text&count=3
struct Response: Decodable {
    let count: Int
    let items: [UserGroup]
}

struct UserGroup: Decodable {
    let id: Int
    let name: String
    let screen_name: String
    let is_closed: Int
    let type: String
    let is_admin: Int
    let is_member: Int
    let is_advertiser: Int
    let photo_50: String
    let photo_100: String
    let photo_200: String
}








