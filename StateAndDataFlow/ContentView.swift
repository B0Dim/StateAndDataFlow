//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by  BoDim on 13.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 20)
            VStack {
                Spacer()
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                Spacer()
                ButtonView(title: "LogOut", color: .blue) {
                    DataManager.shared.removeUser(userManager: userManager)
                }
                .padding(.bottom, 20)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


