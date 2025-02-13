//
//  RootView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct RootView: View {

    @Environment(Router.self) var router

    @State var vm = RootViewModel()

    var body: some View {

        @Bindable var router = router

        NavigationStack(path: $router.navPath) {
            ZStack {

                if vm.userLoginState {

                    ZStack {

                        HomeView(sliderScreenVisibility: $vm.showMenu)
                            .onAppear {
                                vm.selectedMenuOption = .all
                            }
                            .offset(x: vm.showMenu ? 290 : 0)

                        SideBarMenuView(isShowing: $vm.showMenu, selectedOption: $vm.selectedMenuOption)
                    }

                    .onChange(of: vm.selectedMenuOption) { _, newValue in
                        switch newValue {
                        case .all:
                            vm.selectedMenuOption = .all
                        case .add: router.navigate(to: .addToDo)
                        case .settigns: router.navigate(to: .settings)
                            vm.selectedMenuOption = .settigns
                        case .tell: router.navigate(to: .tellAFriend)
                            vm.selectedMenuOption = .tell
                        }
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
