//
//  ListRowViewModifier.swift
//  ToDoList
//
//  Created by abdullah on 07.02.2025.
//

import SwiftUI

struct ListRowViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 5))
            .listRowBackground(Color.white)
            
    }

}

extension View {
    func makeListRowItem() -> some View {
        self.modifier(ListRowViewModifier())
    }
}
