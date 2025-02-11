//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @State private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(router)
        }
    }
}
