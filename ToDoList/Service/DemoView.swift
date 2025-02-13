//
//  DemoView.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import SwiftUI
import FirebaseFirestore


struct DemoView: View {
    
    @State private var listener: ListenerRegistration?
    
    @State var allTask: [TodoItem] = []
    
    var body: some View {

        VStack {
            
            List(allTask) { task in
                
                TodoItemView(toDoItem: task) {
                    Task {
                        do {
                                            
                            try await FirestoreService.shared.updateCheckState(task)
                                            
                        } catch {
                            print("*Error: ", error)
                        }
                    }
                }
                .transition(.slide)
                .swipeActions {
                    Button("Delete") {
                        Task {
                            do {
                                        
                                try await FirestoreService.shared.deleteTas(task)
                                                                    
                            } catch {
                                print("*Error: ", error)
                            }
                        }
                    }.foregroundStyle(.red)
                }
                
            }.refreshable {
                Task {
                    do {
                                                    
                        let result = try await FirestoreService.shared.gettAllTasks()
                        print(result)
                        withAnimation {
                            allTask = result
                        }
                                                    
                    } catch {
                        print("*Error: ", error)
                    }
                }
            }
            
        }.onAppear {
            
            listener = FirestoreService.shared.addTaskListener(completion: { todoItems in
                allTask = todoItems
            })
           
        }

    }
}

#Preview {
    DemoView()
}
