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
    
    
    
    var body: some View {
        ZStack {
                        
            TabView(selection: $selectedMenu) {
                            
                HomeView(presentSideMenu: $showMenu)
                    .tag(SideMenuOptionModel.all)
                            
                AddNewTaskView()
                    .tag(SideMenuOptionModel.add)
                            
                SettignsView()
                    .tag(SideMenuOptionModel.settigns)
                            
                HelpView()
                    .tag(SideMenuOptionModel.help)
                            
                TellAFriendView()
                    .tag(SideMenuOptionModel.tell)
                            
            }
                        
            SideBarMenuView(isShowing: $showMenu, selectedOption: $selectedMenu)
                        
        }
    }
}

#Preview {
    MainTabView(selectedMenu: .constant(.add), showMenu: .constant(false))
        .environment(Router())
}
