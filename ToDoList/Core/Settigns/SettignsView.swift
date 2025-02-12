//
//  SettignsView.swift
//  ToDoList
//
//  Created by abdullah on 08.02.2025.
//

import SwiftUI

struct SettignsView: View {
    
    @Environment(Router.self) var router
    
    var body: some View {
        VStack {
            Button("Exit") {
                try? AuthService.shared.signOut()
                router.navigateHome()
                
            }
        }
    }
}

#Preview {
    SettignsView()
        .environment(Router())
}
