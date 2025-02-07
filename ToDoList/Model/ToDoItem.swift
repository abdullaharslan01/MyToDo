//
//  ToDoItem.swift
//  ToDoList
//
//  Created by abdullah on 07.02.2025.
//

import Foundation

struct TodoItem: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    let title: String
    let date: Date?
    let notes: String?
    let category: Category
    var isCompleted: Bool
}


extension TodoItem {
    static var sampleData: [TodoItem] = [
      
        TodoItem(title: "Read about Design Systems", date: Date().addingTimeInterval(259200), notes: "Material Design and Human Interface Guidelines", category: .allCategory[0], isCompleted: false),
        TodoItem(title: "Read AI articles", date: Date().addingTimeInterval(345600), notes: "Research ML and CoreML", category: .allCategory[1], isCompleted: false),
        TodoItem(title: "Create weekly workout plan", date: Date().addingTimeInterval(432000), notes: "Plan running and fitness routine", category: .allCategory[2], isCompleted: true),
        TodoItem(title: "Write new Medium article", date: Date().addingTimeInterval(518400), notes: "About iOS performance optimizations", category: .allCategory[0], isCompleted: true),
        TodoItem(title: "Practice violin", date: nil, notes: "Learn a new piece", category: .allCategory[2], isCompleted: false)
    ]
}
