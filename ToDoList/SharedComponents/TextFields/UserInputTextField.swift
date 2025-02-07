//
//  UserInputTextField.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct UserInputTextField: View {
    
    var hint: String
    @Binding var text: String
    @FocusState private var isActive: Bool
    var isPasswordField: Bool = false
  
    var onChange: () -> ()?
    
    @ViewBuilder
    func userInputField() -> some View {
        if isPasswordField {
            SecureField(hint, text: $text)
        } else {
            TextField(hint, text: $text)
                .keyboardType(.emailAddress)
            
        }
    }
    
    var body: some View {
        HStack {
                    
            Image(systemName: isPasswordField ? "lock.rotation" : "person")
                .font(.title2)
                .foregroundStyle(.tdPrimary)
                .padding(.trailing, 5)
                      
            userInputField()
                .foregroundStyle(.tdPrimaryText)
                .focused($isActive)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 55)
        .clipShape(.rect(cornerRadius: 16))
        .overlay(content: {
            RoundedRectangle(cornerRadius: 16).stroke(isActive ? .tdPrimaryText : .gray.opacity(0.2), lineWidth: 1)
        })
        .shadow(radius: 10, x: 0, y: 1)
        
        .onChange(of: text) { _, _ in
            onChange()
        }
    }
}

#Preview {
    UserInputTextField(hint: "", text: .constant("")) {
        
    }
}
