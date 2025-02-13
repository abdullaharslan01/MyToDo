//
//  AllTaskViewModel.swift
//  ToDoList
//
//  Created by abdullah on 07.02.2025.
//

import FirebaseFirestore
import Foundation
import Observation

@Observable
class AllTaskViewModel {

    var listener: ListenerRegistration?

    var allList: [TodoItem] = [] {
        didSet {
            self.filterCheckState()
        }
    }
    var animationID = UUID()
    var complatedClicked: Bool = false
    var complated: [TodoItem] = []
    var unComplated: [TodoItem] = []

    func filterCheckState() {
        self.complated = self.allList.filter { $0.isCompleted == true
        }
        self.unComplated = self.allList.filter { $0.isCompleted == false
        }
    }

    func updateCheckerState(_ task: TodoItem) {
        
        if !task.isCompleted {
            
            complatedClicked.toggle()
            animationID = UUID()
        }
  
        
        Task {
            do {
                try await FirestoreService.shared.updateCheckState(task)

            } catch {}
        }
    }

    func deleteTask(_ task: TodoItem) {
        Task {

            do {
                try await FirestoreService.shared.deleteTas(task)

            } catch {
                print(error.localizedDescription)
            }

        }
    }

    @MainActor
    func addListener() {
        self.listener = FirestoreService.shared.addTaskListener(completion: { todoItems in
            self.allList = todoItems
        })
    }

}
