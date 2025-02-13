//
//  RootViewModel.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import Foundation
import Observation

@Observable
class RootViewModel {
    var selectedMenuOption: SideMenuOptionModel = .all
    var showMenu: Bool = false
    var userLoginState: Bool = false
    var currentDate: Date  = .now
    
    func checkUserLoginState() {

        do {
            _ = try AuthService.shared.getAuthenticatedUser()
            userLoginState = true
        } catch {
            userLoginState = false
        }

    }

}
