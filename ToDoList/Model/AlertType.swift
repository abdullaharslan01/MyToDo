//
//  AlertType.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import SwiftUI

enum AlertType {
    case error(title: String, message: String)
    case success(title: String, message: String)
    case warning(title: String, message: String)

    var alert: Alert {
        switch self {
        case .error(let title, let message),
             .success(let title, let message),
             .warning(let title, let message):
            return Alert(
                title: Text(title),
                message: Text(message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
