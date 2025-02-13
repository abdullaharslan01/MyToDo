//
//  TodoItemView.swift
//  ToDoList
//
//  Created by abdullah on 07.02.2025.
//

import SwiftUI

class Helper {
    static let shared = Helper()
    
    func getCategoryFromId(_ id: String) -> Category {
        if let category = Category.allCategory.first(where: {$0.id == id}) {
            return category
        }
         
        return Category.allCategory[0]
    }
}

struct TodoItemView: View {
    var toDoItem: TodoItem
    var onTapGesture: () -> ()
    
    var body: some View {
        HStack {
            HStack {
                        
                CategoryIconView(categoryItem: Helper.shared.getCategoryFromId(toDoItem.categoryId), isSelected: false) {}
                        
                VStack(alignment: .leading) {
                    Text(toDoItem.title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.black)
                        .strikethrough(toDoItem.isCompleted)
                            
                    if let date = toDoItem.date {
                        Text(date.formattedWithTime())
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(.tdBody)
                            .opacity(0.7)
                            .strikethrough(toDoItem.isCompleted)
                    }
                            
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                .opacity(toDoItem.isCompleted ? 0.5 : 1)
                    
            Image(toDoItem.isCompleted ? "checked" : "unchecked")
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
                    
        }
        .frame(height: 80)
        .background(.white)
        .onTapGesture {
            onTapGesture()
        }
    }
}
