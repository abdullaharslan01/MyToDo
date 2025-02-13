//
//  SignInViewModel.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import Foundation
import Observation

@Observable
class SignInViewModel {
    
    var email: String = ""
    var password: String = ""
    
    var isLoading: Bool = false
    var isLoadingState: Bool = false
    
    var alertPresentedState: Bool = false
    
    var currentAlert: AlertType = .error(title: "", message: "")
    
    func validateInputs() -> Bool {
        if !isValidEmail(email) {
            currentAlert = .error(title: "Invalid Email", message: "Please enter a valid email address.")
            alertPresentedState = true
            return false
        }
       
        if password.count < 6 {
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
    
    func signInWithEmailAndPassword() {
        if validateInputs() {
            isLoading.toggle()
            Task {
                
                do {
                    
                    let _ = try await AuthService.shared.signIn(withEmail: email.lowercased(), password: password)
                    isLoadingState = true
                } catch {
                    currentAlert = .error(title: "Error", message: error.localizedDescription)
                    alertPresentedState = true
                }
                isLoading.toggle()
            }
        }
       
    }
    
}
