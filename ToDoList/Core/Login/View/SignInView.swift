//
//  SignInView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

enum SignInFocused {
    case email
    case password
}

struct SignInView: View {
  
    @State private var vm = SignInViewModel()
    
    @Environment(Router.self) private var router
    @FocusState var focused: SignInFocused?
    
    var body: some View {
        
        ZStack {
            if vm.isLoading {
                ProgressView().tint(.tdPrimaryText)
                    .controlSize(.large)
                    .offset(y: -50)
                        
            }
            
            VStack(spacing: 30) {
                      
                Text("Sign In")
                    .foregroundStyle(.tdPrimary)
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical, 30)
                        
                VStack(spacing: 20) {
                    
                    UserInputTextField(hint: "email", text: self.$vm.email) {}
                        .submitLabel(.next).onSubmit {
                            focused = .password
                        }.focused($focused, equals: .email)
                        .textCase(.lowercase)
                    
                    UserInputTextField(hint: "password", text: self.$vm.password, isPasswordField: true) {}.submitLabel(.done).focused($focused, equals: .password)
                            
                    Button {} label: {
                        Text("Forgot password?")
                            .foregroundStyle(.tdPrimaryText)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                            
                }.toolbar {
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Button("Done") {
                                focused = nil
                            }.frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                }
                        
                MainButtonView("Sign In") {
                    vm.signInWithEmailAndPassword()
                }.disabled(vm.isLoading)
                    .sensoryFeedback(.success, trigger: vm.isLoading)
                        
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

                    Button {
                        router.navigate(to: .signUp)
                    } label: {
                        Text("Sign Up")
                            .foregroundStyle(.tdSecondary)
                            .bold()
                    }

                }
                        
            }.padding(.horizontal)
                .alert(isPresented: $vm.alertPresentedState) {
                    vm.currentAlert.alert
                }.background(.page)
                .opacity(vm.isLoading ? 0.8 : 1).onChange(of: vm.isLoadingState) { _, _ in
                    if vm.isLoadingState {
                        router.navigateHome()
                    }
                }.onTapGesture {
                    UIApplication.shared.endEditing()
                }
        }
        
    }
}

#Preview {
    SignInView()
        .environment(Router())
}
