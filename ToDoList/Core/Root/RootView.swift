//
//  RootView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct RootView: View {

    @Environment(Router.self) var router
    
    
    @State var vm  = RootViewModel()

    var body: some View {

        @Bindable var router = router

        NavigationStack(path: $router.navPath) {
            ZStack {

                if vm.userLoginState {
                    
                    ZStack {

                        HomeView(presentSideMenu: $vm.showMenu)
                        
                        SideBarMenuView(isShowing: $vm.showMenu, selectedOption: $vm.selectedMenuOption)
                    }.onChange(of: vm.selectedMenuOption) { oldValue, newValue in
                        switch newValue {
                        case .all : router.navigateHome()
                        case .add : router.navigate(to: .addToDo)
                        case .help: router.navigate(to: .helpAndFeedBack)
                        case .settigns: router .navigate(to: .settings)
                        case .tell: router.navigate(to: .tellAFriend)
                        }
                    }.onChange(of: vm.userLoginState) { oldValue, newValue in
                        print("Login state was changed: \(newValue)")
                    }
                    
                } else {
                    OnboardView()
                }

            }
            .onAppear(perform: {
                vm.checkUserLoginState()
            })
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
