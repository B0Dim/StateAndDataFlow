//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by  BoDim on 13.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            UserNameView(
                name: $userManager.user.name,
                isValidName: userManager.isValidName
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.isValidName)
        }
    }
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isLoggedIn.toggle()
            DataManager.shared.save(user: userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

