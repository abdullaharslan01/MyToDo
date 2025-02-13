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

                       
                        HomeView()
                            .onAppear {
                                vm.selectedMenuOption = .all
                            }
                            
                            

                        SideBarMenuView(isShowing: $vm.showMenu, selectedOption: $vm.selectedMenuOption)
                    }
                    
                
                    .onChange(of: vm.selectedMenuOption) { _, newValue in
                        switch newValue {
                        case .all:
                            vm.selectedMenuOption = .all
                        case .add: router.navigate(to: .addToDo)
                        case .help: router.navigate(to: .helpAndFeedBack)
                            vm.selectedMenuOption = .help
                        case .settigns: router.navigate(to: .settings)
                            vm.selectedMenuOption = .settigns
                        case .tell: router.navigate(to: .tellAFriend)
                            vm.selectedMenuOption = .tell
                        }
                    }

                } else {
                    OnboardView()
                }

            }.toolbar(content: {

                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            vm.showMenu.toggle()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundStyle(.page)

                    }

                }

                ToolbarItem(placement: .principal) {
                    Text(vm.currentDate.formattedWithDate())
                        .font(.title3)
                        .foregroundStyle(.page)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Image("user")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(.circle)
                }

            })
            .toolbarVisibility(vm.showMenu ? .hidden : .visible, for: .navigationBar)

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
