//
//  AllTaskView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct AllTaskView: View {

    var currentDate: Date = .now

    var allTodos: [TodoItem]

    var complated: [TodoItem]
    var unComplated: [TodoItem]

    @State var addNewTaskScreenState: Bool = false

    init(currentDate: Date, allTodos: [TodoItem]) {
        self.currentDate = currentDate
        self.allTodos = allTodos
        self.complated = allTodos.filter { $0.isCompleted == true
        }
        self.unComplated = allTodos.filter { $0.isCompleted == false
        }
    }

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
                Button {} label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)

                }.frame(maxWidth: .infinity, alignment: .leading)

                Text(self.currentDate.formattedWithDate())
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)

                Image("user")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                    .frame(maxWidth: .infinity, alignment: .trailing)

            }.foregroundStyle(.page)
                .padding(.horizontal)
                .padding(.bottom, 20)

            Text("My Todo List")
                .foregroundStyle(.page)
                .font(.system(size: 30, weight: .bold))

        }

    }

    var body: some View {

        NavigationStack {
            VStack {
                ZStack {
                    self.headerView
                    self.headerSection

                }

                List {

                    Section {
                        ForEach(self.unComplated) { toDoItem in
                            TodoItemView(toDoItem: toDoItem) {
                                print("Clicked \(toDoItem.title)")
                            }
                            .makeListRowItem()

                        }
                    }.clipShape(.rect(cornerRadius: 20))

                    Section {

                        ForEach(self.complated) { toDoItem in
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

            }.safeAreaInset(edge: .bottom, content: {

                MainButtonView("Add New Task") {
                    self.addNewTaskScreenState.toggle()
                }.padding(.horizontal)

            })
            .navigationDestination(isPresented: $addNewTaskScreenState) {
                AddNewTaskView().navigationBarBackButtonHidden()
            }

            .background(.page)
            .ignoresSafeArea(edges: .top)
        }

    }
}

struct ListRowViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 5))
            .listRowBackground(Color.white)
    }

}

extension View {
    func makeListRowItem() -> some View {
        self.modifier(ListRowViewModifier())
    }
}

#Preview {
    NavigationStack {
        AllTaskView(currentDate: .now, allTodos: TodoItem.sampleData)
    }
}
