//
//  UsersViewModel.swift
//  TellStory
//
//  Created by Guillaume Demergès on 24/10/2022.
//

import Foundation

class usersViewModel: ObservableObject{
    @Published var user1 = User(mail: "", username: "test", password: "test", image: "")
}

enum UserError: Error {
    case loginPasswordEmpty
    case invalidLogin
    case invalidPassword
    case passwordNotMatching
    case loginTaken
}
