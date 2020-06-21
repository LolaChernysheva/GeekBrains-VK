//
//  ResponseGetUserPhotos.swift
//  iOS
//
//  Created by Лолита on 22.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import RealmSwift

class VKResponseGetUserPhotos: Decodable {
   let response: ResponseGetPhoto
}
class ResponseGetPhoto: Decodable {
    let items: [PhotoList]
    let text: String!
}
class PhotoList: Object, Decodable {
  @objc dynamic  var album_id: Int
  @objc dynamic  var date: Int
  @objc dynamic  var id: Int
   @objc dynamic var owner_id: Int
   @objc dynamic var has_tags: Bool
   @objc dynamic var post_id: Int
   @objc dynamic var sizes: [Sizes]
}
class Sizes: Object,  Decodable {
   @objc dynamic var height: Int
   @objc dynamic var url: String
   @objc dynamic var type: String
   @objc dynamic var width: Int
}
