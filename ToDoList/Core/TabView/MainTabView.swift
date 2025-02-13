//
//  MainTabView.swift
//  ToDoList
//
//  Created by abdullah on 11.02.2025.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var selectedMenu: SideMenuOptionModel
    @Binding var showMenu: Bool
    
    @Environment(Router.self) private var router
    
    var body: some View {
        ZStack {
           
            
               
        }
    }
}

#Preview {
    MainTabView(selectedMenu: .constant(.all), showMenu: .constant(false))
        .environment(Router())
}
