//
//  AllTaskView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct HomeView: View {

    @State var vm = AllTaskViewModel()

    @Environment(Router.self) private var router

    @Binding var presentSideMenu: Bool

    var headerView: some View {
        Image("allTaskHeader")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .frame(height: 222)
    }

    var headerSection: some View {

        VStack {

            HStack {
                Button {
                    withAnimation {
                        presentSideMenu.toggle()
                    }
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)

                }

                Text(vm.currentDate.formattedWithDate())
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .center)

                Image("user")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)

            }.foregroundStyle(.page)
                .padding(.horizontal)
                .padding(.bottom, 20)

            Text("My Todo List")
                .foregroundStyle(.page)
                .font(.system(size: 30, weight: .bold))

        }

    }

    var body: some View {

        VStack {
            ZStack {
                self.headerView
                self.headerSection

            }

            List {

                Section {
                    ForEach(vm.unComplated) { toDoItem in
                        TodoItemView(toDoItem: toDoItem) {}
                            .makeListRowItem()

                    }
                }.clipShape(.rect(cornerRadius: 20))

                Section {

                    ForEach(vm.complated) { toDoItem in
                        TodoItemView(toDoItem: toDoItem) {}
                            .cornerRadius(10)
                            .makeListRowItem()

                    }

                } header: {
                    Text("Completed Tasks").foregroundStyle(.tdBody)
                }

            }.listStyle(.insetGrouped)
                .scrollContentBackground(.hidden)
                .offset(y: -70)
                .refreshable {}
                .ignoresSafeArea(edges: .bottom)

        }.safeAreaInset(edge: .bottom, content: {

            MainButtonView("Add New Task") {
                router.navigate(to: .addToDo)
            }.padding(.horizontal)

        })

        .background(.page)
        .ignoresSafeArea(edges: .top)

    }
}

#Preview {
    NavigationStack {
        HomeView(presentSideMenu: .constant(false))
            .environment(Router())

    }
}
