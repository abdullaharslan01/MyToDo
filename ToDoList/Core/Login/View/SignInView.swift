//
//  SignInView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct SignInView: View {
    @State var mailField = ""
    @State var passwordField = ""
    
    var body: some View {
        
        VStack(spacing: 30) {
          
            Text("Sign In")
                .foregroundStyle(.tdPrimary)
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 30)
            
            VStack(spacing: 20) {
                UserInputTextField(hint: "email", text: self.$mailField) {}
                            
                UserInputTextField(hint: "password", text: self.$passwordField, isPasswordField: true) {}
                
                Button {} label: {
                    Text("Forgot password?")
                        .foregroundStyle(.tdPrimaryText)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
            }
            
            MainButtonView("Sign In") {}
            
            Text("Or sign in with")
                .font(.callout)
                .foregroundStyle(.tdGray)
            
            HStack(spacing: 20) {
                LoginWithButton(buttonType: .facebook) {}
                LoginWithButton(buttonType: .google) {}
                LoginWithButton(buttonType: .linkedIn) {}
            }
            
            Spacer()
            HStack {
                Text("Already have an account?")
                    .foregroundStyle(.tdGray)

                Button {} label: {
                    Text("Sign Up")
                        .foregroundStyle(.tdSecondary)
                        .bold()
                }

            }
            
        }.padding(.horizontal)
        
    }
}

#Preview {
    SignInView()
}
