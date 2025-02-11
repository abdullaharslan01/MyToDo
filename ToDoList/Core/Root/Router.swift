//
//  Router.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

@Observable
class Router {
    
    var navPath = NavigationPath()
    
    public enum Destination: Codable, Hashable {
        case onboarding
        case signIn
        case signUp
        case addToDo
        case helpAndFeedBack
        case settings
        case tellAFriend
    }
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateHome() {
        navPath.removeLast(navPath.count)
    }
    
}
