//
//  DemoView.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        MainButtonView("Login") {
            
        }.disabled(true)
    }
}

#Preview {
    DemoView()
}
