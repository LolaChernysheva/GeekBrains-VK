//
//  VKApi.swift
//  iOS
//
//  Created by Лолита on 18.05.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import RealmSwift

class VKApi {
    
    static let session = Session.shared
    static func getFriends(completion: @escaping ([FriendsList]) -> Void) {
        let accessParametres = ["access_token": session.token]
        //requesring a list of users
        var urlFriendsList = URLComponents()
        urlFriendsList.scheme = "https"
        urlFriendsList.host = "api.vk.com"
        urlFriendsList.path = "/method/friends.get"
        urlFriendsList.queryItems = [
            URLQueryItem(name: "user_id", value: session.userId),
            URLQueryItem(name: "order", value: "name"),
            URLQueryItem(name: "fields", value: "first_name,last_name,domain,sex,city,photo_50"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        AF.request(urlFriendsList, method: .get, parameters: accessParametres).responseJSON{  response
            in
            guard let data = response.data else {return}
            do {
                let vkResponseFriendsGet = try JSONDecoder().decode(VKResponseFriendsGet.self, from: data)
                
                self.saveFriendsData(vkResponseFriendsGet.response.items)
                completion(vkResponseFriendsGet.response.items)
                
                
            } catch {
                print(error)
            }

           //print(response.value ?? "")
        }
    }
    
    static func getUserGroups(completion: @escaping ([GroupsList]) -> Void) {
        //requesting a list of user's groups
        let accessParametres = ["access_token": session.token]
        var urlGroupList = URLComponents()
        urlGroupList.scheme = "https"
        urlGroupList.host = "api.vk.com"
        urlGroupList.path = "/method/groups.get"
        urlGroupList.queryItems = [
            URLQueryItem(name: "user_id", value: session.userId),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        AF.request(urlGroupList, method: .get, parameters: accessParametres).responseJSON {response in
            guard let data = response.data else {return}
            do {
                let groups = try JSONDecoder().decode(VKResponseUserGroupsGet.self, from: data)
                completion(groups.response.items)
                print(groups)
            } catch {
                print(error)
            }
           // print(response.value ?? "")
        }
    }
    static func searchGroups(text: String) {
//https://api.vk.com/method/groups.search?v=5.103&access_token=d63d0298ece8d218b0ca0b5db757d848b508d2986b74569e34d28b904be9b4cd2d75cffa8a2b9d3a74bf9&q=text&count=3
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
            guard let data = response.data else {return}
            do {
                let groups = try JSONDecoder().decode(VKResponse.self, from: data)
                print(groups)
            } catch {
                print(error)
            }
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
            guard let data = response.data else {return}
            do {
                let groups = try JSONDecoder().decode(VKResponseGetUserPhotos.self, from: data)
                
                print(groups)
            } catch {
                print(error)
            }
        print(response.value ?? "")
        }
    }
    //сохранение погодных данных в Realm
   static func saveFriendsData(_ friends: [FriendsList]) {

    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
                
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // кладем все объекты класса погоды в хранилище
                realm.add(friends)
                
    // завершаем изменения хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
    }

}



