//
//  SideBarMenuView.swift
//  ToDoList
//
//  Created by abdullah on 11.02.2025.
//

import SwiftUI

struct SideBarMenuRowView: View {

    let sideBarMenuItem: SideMenuOptionModel

    @Binding var selectedOption: SideMenuOptionModel

    private var isSelected: Bool {
        return sideBarMenuItem == selectedOption
    }

    var body: some View {
        HStack {
            Image(systemName: sideBarMenuItem.symbolImage)
                .font(.title3)

            Text(sideBarMenuItem.title)
                .font(.callout)
        }
        .padding()
        .padding(.leading, 5)
        .foregroundStyle(isSelected ? .page : .tdPrimaryText)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            .tdPrimary.opacity(isSelected ? 1 : 0.1)
        ).clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 0, bottomTrailing: 16, topTrailing: 16)))
    }
}

#Preview {
    SideBarMenuRowView(sideBarMenuItem: .tell, selectedOption: .constant(.all))
        .padding(.horizontal)
}
