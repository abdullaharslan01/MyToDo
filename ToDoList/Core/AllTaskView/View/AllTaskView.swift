//
//  AllTaskView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct AllTaskView: View {

    @State var vm = AllTaskViewModel()
    
  

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

                Text(vm.currentDate.formattedWithDate())
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
                        ForEach(vm.unComplated) { toDoItem in
                            TodoItemView(toDoItem: toDoItem) {
                                print("Clicked \(toDoItem.title)")
                            }
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

            }.safeAreaInset(edge: .bottom, content: {

                MainButtonView("Add New Task") {
                    vm.addNewTaskScreenState.toggle()
                }.padding(.horizontal)

            })
            .navigationDestination(isPresented: $vm.addNewTaskScreenState) {
                AddNewTaskView().navigationBarBackButtonHidden()
            }

            .background(.page)
            .ignoresSafeArea(edges: .top)
        }

    }
}



#Preview {
    NavigationStack {
        AllTaskView()
    }
}
