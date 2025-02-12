//
//  SignInViewModel.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import Observation
import SwiftUI

@Observable
class SignUpViewModel {
    
    var mailField = ""
    var passwordField0 = ""
    var passwordField1 = ""

    var alertPresentedState: Bool = false
    var currentAlert: AlertType = .error(title: "", message: "")

    var isLoginState: Bool = false
    
    var isLoading: Bool = false
   
    
    func validateInputs() -> Bool {
        if !isValidEmail(mailField) {
            currentAlert = .error(title: "Invalid Email", message: "Please enter a valid email address.")
            alertPresentedState = true
            return false
        }
        
        if passwordField0 != passwordField1 {
            currentAlert = .error(title: "Password Mismatch", message: "Passwords do not match.")
            alertPresentedState = true
            return false
        }
        
        if passwordField0.count < 6 {
            currentAlert = .error(title: "Weak Password", message: "Password must be at least 6 characters long.")
            alertPresentedState = true
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
            let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email.trimmingCharacters(in: .whitespaces))
        }
    
    func createUser() {
       
        
        if validateInputs() {
            isLoading.toggle()
            Task {
                do {
                    let _ = try await AuthService.shared.createUser(withEmail: mailField, password: passwordField0)
                    isLoginState = true
                    
                 
                } catch {
                    currentAlert = .error(title: "Error", message: error.localizedDescription)
                    alertPresentedState = true
                
                }
                isLoading.toggle()
            }
            
            
        }
    }
}
