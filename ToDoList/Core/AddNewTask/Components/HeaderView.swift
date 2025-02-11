//
//  HeaderView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct HeaderView: View {

    let title: String
    var onTapCloseButton: () -> ()

    var body: some View {
        ZStack {
            Image("newTaskHeader")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 120)

            HStack(spacing: 0) {

                CloseButton(fill: false) {
                    onTapCloseButton()

                }.padding(.leading, 20)
                Spacer()
                Text(title)
                    .foregroundStyle(.white)
                    .font(.title3)
                    .bold()
                    .offset(x: -20)
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal, 50)
        }
    }
}
