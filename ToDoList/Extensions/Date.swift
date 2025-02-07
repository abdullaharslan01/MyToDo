//
//  Date.swift
//  ToDoList
//
//  Created by abdullah on 07.02.2025.
//

import SwiftUI


extension Date {
    func formattedWithTime() -> String {
        let formater = DateFormatter()
        formater.dateStyle = .short
        formater.dateFormat = "HH:mm"
        return formater.string(from: self)
    }
    
    func formattedWithDate() -> String {
        let formatter = DateFormatter()
                formatter.dateStyle = .medium
                return formatter.string(from: self)
    }
}
