//
//  EmtyView.swift
//  ToDoList
//
//  Created by abdullah on 13.02.2025.
//

import Lottie
import SwiftUI

struct EmtyView: View {
    var body: some View {
        VStack {

            LottieView(animation: .named("emty"))
                .looping()

            VStack(spacing: 10) {
                Text("No Tasks Available")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)

                Text("Tap 'Add New Task' to create your first task and start organizing your to-dos.")
                    .font(.body)
                    .foregroundColor(.gray.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }

        }
    }
}

#Preview {

    EmtyView().background(.page)

}
