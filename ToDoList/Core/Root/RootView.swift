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
    
    @State var selectedMenuOption: SideMenuOptionModel = .all
    @State var showMenu: Bool = false

    var body: some View {

        @Bindable var router = router

        NavigationStack(path: $router.navPath) {
            ZStack {

                if isUserLogIn {
                    
                    ZStack {

                        HomeView(presentSideMenu: $showMenu)
                        
                        SideBarMenuView(isShowing: $showMenu, selectedOption: $selectedMenuOption)
                    }.onChange(of: selectedMenuOption) { oldValue, newValue in
                        switch newValue {
                        case .all : router.navigateHome()
                        case .add : router.navigate(to: .addToDo)
                        case .help: router.navigate(to: .helpAndFeedBack)
                        case .settigns: router .navigate(to: .settings)
                        case .tell: router.navigate(to: .tellAFriend)
                        }
                    }
                    
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
