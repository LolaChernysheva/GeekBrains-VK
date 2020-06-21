//
//  Responses.swift
//  iOS
//
//  Created by Лолита on 21.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class VKResponse: Decodable {
    let response: Response
    
}
//https://api.vk.com/method/groups.search?v=5.103&access_token=d63d0298ece8d218b0ca0b5db757d848b508d2986b74569e34d28b904be9b4cd2d75cffa8a2b9d3a74bf9&q=text&count=3
class Response: Decodable {
    let count: Int
    let items: [UserGroup]
}

class UserGroup: Object, Decodable {
  @objc dynamic  var id: Int
  @objc dynamic  var name: String
  @objc dynamic  var screen_name: String
   @objc dynamic var is_closed: Int
   @objc dynamic var type: String
   @objc dynamic var is_admin: Int
   @objc dynamic var is_member: Int
   @objc dynamic var is_advertiser: Int
   @objc dynamic var photo_50: String
   @objc dynamic var photo_100: String
   @objc dynamic var photo_200: String
}








