//
//  VKApi.swift
//  iOS
//
//  Created by Лолита on 18.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import Alamofire
class VKApi {
    static let session = Session.shared
    static func getFriends() {
        let accessParametres = ["access_token": session.token]
        //requesring a list of users
        var urlFriendsList = URLComponents()
        urlFriendsList.scheme = "https"
        urlFriendsList.host = "api.vk.com"
        urlFriendsList.path = "/method/groups.get"
        urlFriendsList.queryItems = [
            URLQueryItem(name: "user_id", value: session.userId),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "count", value: "3"),
            URLQueryItem(name: "fields", value: "nickname, domain, sex, bdate, city"),
            URLQueryItem(name: "name_case", value: "ins"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        AF.request(urlFriendsList, method: .get, parameters: accessParametres).responseJSON{ response
            in
            print(response.value ?? "")
        }
    }
    static func getUserGroups() {
        //requesting a list of user's groups
        let accessParametres = ["access_token": session.token]
        var urlGroupList = URLComponents()
        urlGroupList.scheme = "https"
        urlGroupList.host = "api.vk.com"
        urlGroupList.path = "/method/groups.get"
        urlGroupList.queryItems = [
            URLQueryItem(name: "user_id", value: session.userId),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "count", value: "3"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        AF.request(urlGroupList, method: .get, parameters: accessParametres).responseJSON {response in
            print(response.value ?? "")
        }
    }
    static func searchGroups(text: String) {
        //requesting a list of groups matching the search criteries
        let accessParametres = ["access_token": session.token]
        var urlGroupSearchList = URLComponents()
        urlGroupSearchList.scheme = "https"
        urlGroupSearchList.host = "api.vk.com"
        urlGroupSearchList.path = "/method/groups.search"
        urlGroupSearchList.queryItems = [
            URLQueryItem(name: "q", value: text),
            URLQueryItem(name: "count", value: "3"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        AF.request(urlGroupSearchList, method: .get, parameters: accessParametres).responseJSON{ response
        in
        print(response.value ?? "")
        }
    }
    static func getUserPhotos() {
        //requesting a list of user photos
        let accessParametres = ["access_token": session.token]
        var urlUserPhoto = URLComponents()
        urlUserPhoto.scheme = "https"
        urlUserPhoto.host = "api.vk.com"
        urlUserPhoto.path = "/method/photos.get"
        urlUserPhoto.queryItems = [
            URLQueryItem(name: "user_id", value: session.userId),
            URLQueryItem(name: "album_id", value: "profile"),
            URLQueryItem(name: "count", value: "3"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        AF.request(urlUserPhoto, method: .get, parameters: accessParametres).responseJSON { response in
            print(response.value ?? "")
        }
    }
}


