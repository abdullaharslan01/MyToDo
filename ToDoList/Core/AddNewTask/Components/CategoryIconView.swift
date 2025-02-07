//
//  CategoryIconView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct CategoryIconView: View {
    let categoryItem: Category
    var isSelected: Bool
    
    var onTapGesture: () -> ()
    
    var body: some View {
        Button {
            onTapGesture()
        } label: {
            
            ZStack {
                Circle()
                    .fill(categoryItem.color.color)
                    .frame(width: 48, height: 48)
                    .overlay {
                        Circle()
                            .stroke(isSelected ? .tdPrimary : .white, lineWidth: 2)
                                        
                    }
                
                Image(categoryItem.iconName)
            }
            
        }

    }
}
