//
//  UserNameView.swift
//  StateAndDataFlow
//
//  Created by  BoDim on 13.02.2022.
//

import SwiftUI

struct UserNameView: View {
    @Binding var name: String
    var isValidName: Bool
    
    var body: some View {
        ZStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text("\(name.count)")
                    .foregroundColor(isValidName ? .green : .red)
                .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

struct UserNameView_Previews: PreviewProvider {
    static var previews: some View {
        UserNameView(name: .constant("Tim"), isValidName: true)
    }
}
