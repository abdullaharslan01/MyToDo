//
//  GetStartedView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            OnboardImageInfoView(onboardItem: .init(
                id: 0,
                title: "Work Smarter, Achieve More",
                description: "Managing your tasks has never been this simple! Stay organized, boost your productivity, and accomplish your goals effortlessly. Get started today!",
                imageName: "getstarted"
            ))
            MainButtonView("Get Started") {}.padding(.horizontal)

            HStack {
                Text("Already have an account?")
                    .foregroundStyle(.tdGray)

                Button {} label: {
                    Text("Sign In")
                        .foregroundStyle(.tdSecondary)
                        .bold()
                }

            }
        }.padding(.horizontal)
    }
}

#Preview {
    GetStartedView()
}
