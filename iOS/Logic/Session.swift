//
//  Session.swift
//  iOS
//
//  Created by Лолита Чернышева on 12.01.2020.
//  Copyright © 2020 Лолита Чернышева. All rights reserved.
//

import Foundation

class Session {
    
    var userId: String = ""
    var token: String = ""
    //создаем объект класса Singleton
    static let shared = Session()
    private init() {
    }
}
