//
//  Category.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI
struct Category: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let iconName: String
    let color: CategoryColor
    init(id: String, name: String, iconName: String, color: CategoryColor) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.color = color
    }
}

enum CategoryColor: Codable, Hashable {
    case task
    case event
    case goal
    
    var color: Color {
        switch self {
        case .task:
            return .task
        case .event:
            return .event
        case .goal:
            return .goal
        }
    }
    
}

extension Category {
    static let allCategory: [Category] = [
        .init(id: "0", name: "Task", iconName: "task", color: .task),
        .init(id: "1", name: "Event", iconName: "calendar", color: .event),
        .init(id: "2", name: "Goal", iconName: "goal", color: .goal)
        
    ]
}
