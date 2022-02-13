//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by  BoDim on 13.02.2022.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()
    
    @AppStorage("user", store: .standard) private var userData: Data?

    private init() {}
    
    func save(user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func fetchUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User() }
        return user
    }
    
    func removeUser(userManager: UserManager) {
        userManager.user.isLoggedIn = false
        userManager.user.name = ""
        userData = nil
    }
}

