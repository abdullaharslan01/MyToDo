//
//  SignUpView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

enum SignUpFocusedState {
    case email
    case password0
    case password1
}

struct SignUpView: View {
    
    @State var vm = SignUpViewModel()
    
    @Environment(Router.self) var router
    
    @FocusState var focused: SignUpFocusedState?
    var body: some View {
        
        ZStack {
         
            if vm.isLoading {
                ProgressView().tint(.tdPrimaryText)
                    .controlSize(.large)
                    .offset(y: -50)
            
            }
            
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
                    UserInputTextField(hint: "email", text: self.$vm.mailField) {}
                        .submitLabel(.next).onSubmit {
                            focused = .password0
                        }.focused($focused, equals: .email)
                        
                                            
                    UserInputTextField(hint: "password", text: self.$vm.passwordField0, isPasswordField: true) {}.submitLabel(.next).onSubmit {
                        focused = .password1
                    }.focused($focused, equals: .password0)
                    
                    UserInputTextField(hint: "password again", text: self.$vm.passwordField1, isPasswordField: true){}.submitLabel(.done) .focused($focused, equals: .password1)
                }.toolbar {
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Button("Done") {
                                focused = nil
                            }.frame(maxWidth: .infinity, alignment: .trailing)
                                
                        }
                    }
                }
                            
                MainButtonView("Sign Up") {
                    vm.createUser()
                }.disabled(vm.isLoading)
                    .sensoryFeedback(.success, trigger: vm.isLoading)
                        
                Text("Or sign up with")
                    .font(.callout)
                    .foregroundStyle(.tdGray)
                            
                HStack(spacing: 20) {
                    LoginWithButton(buttonType: .facebook) {}
                    LoginWithButton(buttonType: .google) {}
                    LoginWithButton(buttonType: .linkedIn) {}
                }
                            
                Spacer()
                            
            }.padding(.horizontal).alert(isPresented: $vm.alertPresentedState) {
                vm.currentAlert.alert
            }
            .background(.page)
            .opacity(vm.isLoading ? 0.8 : 1)
            .onChange(of: vm.isLoginState) { _, _ in
                if vm.isLoginState {
                    router.navigateHome()
                   
                }
            }.onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
        
    }
}

#Preview {
    SignUpView()
        .environment(Router())
}
