//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by  BoDim on 13.02.2022.
//

import Combine

final class UserManager: ObservableObject {
    @Published var user = User()
    
    var isValidName: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isLoggedIn = false
}
