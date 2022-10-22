//
//  User.swift
//  TellStory
//
//  Created by Guillaume Demergès on 20/10/2022.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var mail: String
    var username: String
    var password: String
    var image: String
}
