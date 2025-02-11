//
//  RootView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct RootView: View {

    @Environment(Router.self) var router
    
    @AppStorage("isUserLogIn") var isUserLogIn: Bool = false
    
    @State var selectedMenu: SideMenuOptionModel = .all
    @State var showMenu: Bool = false

    var body: some View {

        @Bindable var router = router

        NavigationStack(path: $router.navPath) {
            ZStack {

                if isUserLogIn {
                    MainTabView(selectedMenu: $selectedMenu, showMenu: $showMenu)
                } else {
                    OnboardView()
                }

            }
            .onAppear(perform: {})
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .onboarding:
                    OnboardView()
                        .navigationBarBackButtonHidden()
                case .signIn:
                    SignInView()
                        .navigationBarBackButtonHidden()
                case .signUp:
                    SignUpView()
                        .navigationBarBackButtonHidden()
                case .addToDo:
                    AddNewTaskView()
                        .navigationBarBackButtonHidden()
                case .helpAndFeedBack:
                    HelpView()
                        .navigationBarBackButtonHidden()
                case .settings:
                    SettignsView()
                        .navigationBarBackButtonHidden()
                case .tellAFriend:
                    TellAFriendView()
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    RootView()
        .environment(Router())
}
