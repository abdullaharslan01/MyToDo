//
//  MainButtonView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct MainButtonView: View {
    var buttonTitle: String
    var onTapGesture: ()->()?
    
    init(_ buttonTitle: String, onTapGesture: @escaping () -> ()?) {
        self.buttonTitle = buttonTitle
        self.onTapGesture = onTapGesture
    }
    
    var body: some View {
        Button {
            onTapGesture()
        } label: {
            Text(buttonTitle)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(.tdPrimary)
                .foregroundStyle(.white)
                .clipShape(.rect(cornerRadius: 16))
        }
    }
}

#Preview {
    MainButtonView("Get Started") {
        
    }
}
