//
//  LoginWithButton.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

enum LoginWithButtonType: String {
    case facebook
    case google
    case linkedIn
    
    var imageName: String {
        return self.rawValue
    }
    
}

struct LoginWithButton: View {
    
    let buttonType: LoginWithButtonType
    var onTapGesture: ()->()?
    
    
    
    
    var body: some View {
        Button {
            onTapGesture()
        } label: {
           
            Image(buttonType.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                    
        }
    }
}
