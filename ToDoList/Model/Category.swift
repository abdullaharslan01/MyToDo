//
//  Category.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI
struct Category: Identifiable, Hashable {
    let id: String
    let name: String
    let iconName: String
    let color: Color
    init(id: String, name: String, iconName: String, color: Color) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.color = color
    }
}

extension Category {
    static let allCategory: [Category] = [
        .init(id: "0", name: "Task", iconName: "task", color: .task),
        .init(id: "1", name: "Event", iconName: "calendar", color: .event),
        .init(id: "2", name: "Goal", iconName: "goal", color: .goal)
        
    ]
}
