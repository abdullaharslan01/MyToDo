//
//  AddNewTaskView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct AddNewTaskView: View {
    
    @State var taskTitle: String = ""
    @State var date: Date = .init()
    @State var notes: String = ""
    @State var selectedCategory: Category = .init(id: "", name: "", iconName: "", color: .tdGray)
    
    @State private var isShowingDatePicker: Bool = false
    @State private var isShowingTimePicker: Bool = false
    
    var formatedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    var timeFormateDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func headerTextView(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 16, weight: .semibold))
            
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView(title: "Add New Task", systemImageName: "xmark") {}
       
            VStack(spacing: 20) {
                
                VStack {
                    
                    headerTextView("Task Title")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Task Title", text: $taskTitle)
                        .padding()
                        .frame(height: 55)
                        .background(Color.white, in: .rect(cornerRadius: 6))
                        .foregroundStyle(.tdPrimaryText)
                    
                }
                
                HStack {
                    headerTextView("Category")
                        .padding(.trailing)
                    HStack(spacing: 20) {
                        ForEach(Category.allCategory) { category in
                            CategoryIconView(categoryItem: category, isSelected: category == selectedCategory) {
                                
                                withAnimation {
                                    selectedCategory = category
                                }
                                
                            }
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                  
                }.padding(.bottom)
                
                HStack {
                    
                    SelectDateTimeView(title: "Date", subTitle: formatedDate, imageName: "calendarDate") {
                        isShowingDatePicker.toggle()
                    }
                        
                    SelectDateTimeView(title: "Time", subTitle: timeFormateDate, imageName: "calendarTime") {
                        isShowingTimePicker.toggle()
                    }
                    
                }
                
                VStack {
                    headerTextView("Notes")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextEditor(text: $notes)
                        .padding()
                        .foregroundStyle(.tdPrimaryText)
                        .textEditorStyle(.plain)
                        .frame(height: 250)
                        .background(Color.white)
                        .clipShape(.rect(cornerRadius: 6))
                }
                
            }
            
            Spacer()
            
            MainButtonView("Save") {}
                
        }.background(.page)
            .ignoresSafeArea()
            .padding(.horizontal)
            .sheet(isPresented: $isShowingDatePicker) {
                SelectDateView(date: date) { selectedDate in
                    date = selectedDate
                    
                }
                .presentationDetents([.fraction(0.75), .large])
            }
            .sheet(isPresented: $isShowingTimePicker) {
                SelectTimeView(date: date) { selectedDate in
                    date = selectedDate
                }.presentationDetents([.fraction(0.50), .large])
            }
    }
}

struct SelectTimeView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var date: Date
    
    var selectedDate: (Date) -> ()
    
    var body: some View {
        VStack {
            HeaderView(title: "Select a time", systemImageName: "xmark") {
                dismiss()
            }
            
            DatePicker("",selection: $date, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .datePickerStyle(.wheel)
                
              
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

struct SelectDateTimeView: View {
    let title: String
    var subTitle: String
    let imageName: String
    
    var onTapGesture: () -> ()
    
    var body: some View {
        
        VStack {
            Text("\(title)")
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.black)
                
            Button {
                onTapGesture()
            } label: {
                HStack {
                    Text(subTitle)
                        .foregroundStyle(.tdGray)
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                                                                                
                    Image(imageName)
                }.padding()
                    .background(.white, in: .rect(cornerRadius: 6))
            }
                
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }

}

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

#Preview {
    AddNewTaskView()
}

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
                    .fill(categoryItem.color)
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

struct Category: Identifiable, Hashable {
    let id: String
    let name: String
    let iconName: String
    let color: Color
    init(id: String, name: String, iconName: String, color: Color) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.color = color
    }
}

extension Category {
    static let allCategory: [Category] = [
        .init(id: "0", name: "Task", iconName: "task", color: .task),
        .init(id: "1", name: "Event", iconName: "calendar", color: .event),
        .init(id: "2", name: "Goal", iconName: "goal", color: .goal)
        
    ]
}
