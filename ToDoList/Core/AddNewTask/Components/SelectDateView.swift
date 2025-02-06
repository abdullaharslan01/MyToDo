//
//  SelectDateView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct SelectDateView: View {
    @Environment(\.dismiss) var dismiss
    @State var date: Date
    
    var selectedDate: (Date) -> ()
    
    var body: some View {
        VStack {
            HeaderView(title: "Select a date", systemImageName: "xmark") {
                dismiss()
            }
                            
            DatePicker("", selection: $date, in: Date.now..., displayedComponents: .date).datePickerStyle(.graphical)
                .tint(.tdPrimary)
                       
            Button {
                selectedDate(date)
                dismiss()
            } label: {
                Text("Select")
                                            
                    .frame(width: 280, height: 48)
                    .background(.tdPrimary)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 16))
            }
           
            Spacer()
        }
    }
}
