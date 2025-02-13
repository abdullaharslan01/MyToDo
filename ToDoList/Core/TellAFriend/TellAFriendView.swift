//
//  TellAFriendView.swift
//  ToDoList
//
//  Created by abdullah on 11.02.2025.
//

import SwiftUI

struct TellAFriendView: View {
    @Environment(Router.self) var router
    
    @Environment(\.openURL) var openURL
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Thanks for your support! 🚀") {
                router.navigateBack()
            }

            Image("logo")
                .resizable()
                .frame(height: 400)
                .colorMultiply(.tdPrimary)
            
         
            
            MainButtonView("Share With Your Friend") {
                openURL(URL(string: "https://github.com/abdullaharslan01")!)
            
            }.padding(.horizontal)

            Spacer()

        }.background(.page)
            .ignoresSafeArea()
    }
}

#Preview {
    TellAFriendView()
        .environment(Router())
}
