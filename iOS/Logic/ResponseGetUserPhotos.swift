//
//  ResponseGetUserPhotos.swift
//  iOS
//
//  Created by Лолита on 22.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation

struct VKResponseGetUserPhotos: Decodable {
    let response: ResponseGetPhoto
}
struct ResponseGetPhoto: Decodable {
    let items: [PhotoList]
    let text: String!
}
struct PhotoList: Decodable {
    let album_id: Int
    let date: Int
    let id: Int
    let owner_id: Int
    let has_tags: Bool
    let post_id: Int
    let sizes: [Sizes]
}
struct Sizes: Decodable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}
