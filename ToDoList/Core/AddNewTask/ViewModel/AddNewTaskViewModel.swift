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

    func isSelectedCategory(_ category: Category) -> Bool {
        return selectedCategory == category
    }

    var formatedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: userSelectedDate)
    }

   
}
