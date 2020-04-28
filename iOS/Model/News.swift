//
//  News.swift
//  iOS
//
//  Created by Лолита Чернышева on 06.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation
class News {
    var userName: String = ""
    var avatar: String = ""
    var timeOfCreation: String = ""
    var newsText: String = ""
    var newsImage: String = ""
    
    init(userName: String, avatar: String, timeOfCreation: String, newsText: String, newsImage: String) {
        self.avatar = avatar
        self.newsImage = newsImage
        self.newsText = newsText
        self.timeOfCreation = timeOfCreation
        self.userName = userName
    }
    init() {
    }
}
