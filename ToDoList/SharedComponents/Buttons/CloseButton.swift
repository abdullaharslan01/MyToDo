//
//  CloseButton.swift
//  ToDoList
//
//  Created by abdullah on 11.02.2025.
//

import SwiftUI


struct CloseButton: View {
    
    var fill: Bool
    var onTapGesture: ()->()
    
    init(fill: Bool = true, onTapGesture: @escaping () -> Void) {
        self.fill = fill
        self.onTapGesture = onTapGesture
    }
    var body: some View {
        Button {
            onTapGesture()
        } label: {
            Circle()
                .fill( fill ? .tdPrimary : .white)
                .frame(width: 48, height: 48)
                .overlay {
                    Image(systemName: "xmark")
                        .foregroundStyle(fill ? .white : .tdPrimary)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
        }
    }
}

#Preview {
    CloseButton() {
        
    }
}
