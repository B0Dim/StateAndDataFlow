//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by  BoDim on 13.02.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    private let user = DataManager.shared.fetchUser()

    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
