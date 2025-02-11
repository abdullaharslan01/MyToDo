//
//  SidebarItem.swift
//  ToDoList
//
//  Created by abdullah on 11.02.2025.
//

import Foundation


enum SideMenuOptionModel: Int, CaseIterable, Hashable, Codable {
    case all
    case add
    case settigns
    case help
    case tell
    
    var title: String {
        switch self {
        case .all:
            return "All Todos"
        case .add:
            return "Add Todo"
        case .settigns:
            return "Settings"
        case .help:
            return "Help and Feedback"
        case .tell:
            return "Tell a Friend"
        }
    }
    
    var symbolImage: String {
        switch self {
        case .all:
            return "list.bullet.rectangle.portrait"
        case .add:
            return "plus.circle"
        case .settigns:
            return "gear"
        case .help:
            return "questionmark.circle"
        case .tell:
            return "person.wave.2"
        }
    }
    
    var id: Int {
        return self.rawValue
    }
    
}

