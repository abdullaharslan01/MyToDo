//
//  SettignsView.swift
//  ToDoList
//
//  Created by abdullah on 08.02.2025.
//

import SwiftUI

struct SettignsView: View {
    
    @Environment(Router.self) var router
    
    var userEmail: String = "abdullaharslan1473@gmail.com"
    var uesrImageLink: String = "user"
    
    var body: some View {
        VStack {
            
            HeaderView(title: "Settings") {
                router.navigateBack()
            }
            
            Image(uesrImageLink)
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(.circle)
           
            HStack {
                Text("Email:").foregroundStyle(.black)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(userEmail)
                    .foregroundStyle(.black)
                    .font(.title3)
            }.padding(.top, 20)
            
            Spacer()
        }.background(.page)
            .ignoresSafeArea()
            .safeAreaInset(edge: .bottom) {
                MainButtonView("Exit") {
                    try? AuthService.shared.signOut()
                    router.navigateHome()
                }.padding(.horizontal)
            }
        
    }
}

#Preview {
    SettignsView()
        .environment(Router())
}
