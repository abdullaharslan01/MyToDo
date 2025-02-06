//
//  HeaderView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let systemImageName: String
    var onTapButton: () -> ()
    
    var body: some View {
        ZStack {
            Image("newTaskHeader")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 120)

            HStack(spacing: 0) {
                
                Button {
                    onTapButton()
                } label: {
                    Circle()
                        .fill(.white)
                        .frame(width: 48, height: 48)
                        .overlay {
                            Image(systemName: systemImageName)
                                .foregroundStyle(.black)
                                .font(.title3)
                        }
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
