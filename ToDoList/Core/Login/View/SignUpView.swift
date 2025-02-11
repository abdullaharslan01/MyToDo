//
//  SignUpView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct SignUpView: View {
    @State var mailField = ""
    @State var passwordField = ""
    @State var passwordFieldAgain = ""
    
    @Environment(Router.self) var router
        
    var body: some View {
            
        VStack(spacing: 30) {
              
            Text("Sign Up")
                .foregroundStyle(.tdPrimary)
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 30)
                .frame(maxWidth: .infinity, alignment: .center)
                .overlay(alignment: .leading) {
                    
                    CloseButton {
                        router.navigateBack()
                    }
                    
                   
                }
            
            VStack(spacing: 20) {
                UserInputTextField(hint: "email", text: self.$mailField) {}
                                
                UserInputTextField(hint: "password", text: self.$passwordField, isPasswordField: true) {}
                UserInputTextField(hint: "password again", text: self.$passwordFieldAgain, isPasswordField: true) {}
            }
                
            MainButtonView("Sign Up") {}
                
            Text("Or sign up with")
                .font(.callout)
                .foregroundStyle(.tdGray)
                
            HStack(spacing: 20) {
                LoginWithButton(buttonType: .facebook) {}
                LoginWithButton(buttonType: .google) {}
                LoginWithButton(buttonType: .linkedIn) {}
            }
                
            Spacer()
                
        }.padding(.horizontal)
            
    }
}

#Preview {
    SignUpView()
        .environment(Router())
}
