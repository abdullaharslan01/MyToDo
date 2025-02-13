//
//  AddNewTaskViewModel.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import Foundation
import Observation

@Observable
class AddNewTaskViewModel {

    var taskTitle: String = ""
    var userSelectedDate: Date = .init()
    var notes: String = ""
    var selectedCategory: Category = .init(id: "", name: "", iconName: "", color: .event)

    var isShowingDatePicker: Bool = false
    var isShowingTimePicker: Bool = false

    var isAddLoadingState: Bool = false

    var alertPresentedState: Bool = false

    var lottie = UUID()

    var currentAlert: AlertType = .success(title: "", message: "")

    func isSelectedCategory(_ category: Category) -> Bool {
        return selectedCategory == category
    }

    var formatedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: userSelectedDate)
    }

    func addNewTask() {

        let task = TodoItem(title: taskTitle, date: userSelectedDate, notes: notes, categoryId: selectedCategory.id, isCompleted: false)

        guard checkTask(task) else {
            currentAlert = .error(title: "Error", message: "Title and Category cannot be empty.")
            alertPresentedState.toggle()
            return
        }

        Task {
            isAddLoadingState = true
            do {
                try await FirestoreService.shared.createNewTask(task)
                currentAlert = .success(title: "Success", message: "Your new task was added successfully.")
                lottie = UUID()

            } catch {
                currentAlert = .error(title: "Error", message: error.localizedDescription)
                alertPresentedState.toggle()
            }
            isAddLoadingState = false

        }
    }

    func checkTask(_ task: TodoItem) -> Bool {
        if task.title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }

        if task.categoryId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }

        return true
    }

}
