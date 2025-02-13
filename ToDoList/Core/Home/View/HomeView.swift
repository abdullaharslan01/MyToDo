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

    var headerView: some View {
        Image("allTaskHeader")
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .frame(height: 222)
    }

    var headerSection: some View {

        VStack {

            Text("My Todo List")
                .foregroundStyle(.page)
                .font(.system(size: 30, weight: .bold))
                .padding(.top, 30)

        }

    }

    var body: some View {

        VStack {
            ZStack {
                self.headerView
                self.headerSection

            }

            ZStack {

                if vm.unComplated.isEmpty && vm.complated.isEmpty {
                    EmtyView().offset(y:-80)
                }

                List {

                    Section {
                        ForEach(vm.unComplated) { toDoItem in
                            TodoItemView(toDoItem: toDoItem) {

                                withAnimation {
                                    vm.updateCheckerState(toDoItem)
                                }

                            }
                            .makeListRowItem()
                            .swipeActions {
                                deleteAction(task: toDoItem)
                                changeCheckState(task: toDoItem)

                            }

                        }
                    }.clipShape(.rect(cornerRadius: 20))

                    Section {

                        ForEach(vm.complated) { toDoItem in
                            TodoItemView(toDoItem: toDoItem) {
                                vm.updateCheckerState(toDoItem)
                            }
                            .cornerRadius(10)
                            .makeListRowItem()
                            .swipeActions {
                                deleteAction(task: toDoItem)
                                changeCheckState(task: toDoItem)
                            }

                        }

                    } header: {

                        if !vm.complated.isEmpty {
                            Text("Completed Tasks").foregroundStyle(.tdBody)
                        }

                    }

                }.listStyle(.insetGrouped)
                    .scrollContentBackground(.hidden)
                    .offset(y: -80)
                    .refreshable {}
                    .ignoresSafeArea(edges: .bottom)
            }

        }
        .onAppear(perform: {
            vm.addListener()
        })
        .onDisappear(perform: {
            vm.listener = nil
        })
        .safeAreaInset(edge: .bottom, content: {

            MainButtonView("Add New Task") {
                router.navigate(to: .addToDo)
            }.padding(.horizontal)

        })

        .background(.page)
        .ignoresSafeArea(edges: .top)

    }

    private func deleteAction(task: TodoItem) -> some View {
        Button(role: .destructive) {

            withAnimation {
                vm.deleteTask(task)
            }

        } label: {

            Image(systemName: "wrongwaysign.fill")

        }
        .tint(.red)
    }

    private func changeCheckState(task: TodoItem) -> some View {
        Button {

            withAnimation {
                vm.updateCheckerState(task)
            }

        } label: {
            VStack {

                Text(task.isCompleted ? "Uncompleted" : "Complated")
            }
        }
        .tint(Color(red: 255/255, green: 128/255, blue: 0/255))
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environment(Router())

    }
}
