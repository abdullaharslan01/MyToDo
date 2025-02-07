//
//  AddNewTaskView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

struct AddNewTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var vm = AddNewTaskViewModel()
    
    var headerView: some View {
        HeaderView(title: "Add New Task", systemImageName: "xmark") {
            dismiss()
        }

    }
    
    var taskTitleSection: some View {
        VStack {
            headerTextView("Task Title")
                .frame(maxWidth: .infinity, alignment: .leading)
                            
            TextField("Task Title", text: $vm.taskTitle)
                .padding()
                .frame(height: 55)
                .background(Color.white, in: .rect(cornerRadius: 6))
                .foregroundStyle(.tdPrimaryText)
                            
        }
    }
    
    var selectDateTimeSection: some View {
        HStack {
                            
            SelectDateTimeMenuView(title: "Date", subTitle: vm.userSelectedDate.formattedWithDate(), imageName: "calendarDate") {
                vm.isShowingDatePicker.toggle()
            }
                                
            SelectDateTimeMenuView(title: "Time", subTitle: vm.userSelectedDate.formattedWithTime(), imageName: "calendarTime") {
                vm.isShowingTimePicker.toggle()
            }
                            
        }
    }
    
    var cateegorySection: some View {
        HStack {
            headerTextView("Category")
                .padding(.trailing)
            HStack(spacing: 20) {
                ForEach(Category.allCategory) { category in
                    
                    CategoryIconView(categoryItem: category, isSelected: vm.isSelectedCategory(category)) {
                        withAnimation {
                            vm.selectedCategory = category
                        }
                    }
                    
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
                          
        }.padding(.bottom)
    }
    
    var addNoteSection: some View {
        VStack {
            headerTextView("Notes")
                .frame(maxWidth: .infinity, alignment: .leading)
                            
            TextEditor(text: $vm.notes)
                .padding()
                .foregroundStyle(.tdPrimaryText)
                .textEditorStyle(.plain)
                .frame(height: 250)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 6))
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            headerView
       
            VStack(spacing: 20) {
                taskTitleSection
                cateegorySection
                selectDateTimeSection
                addNoteSection
                
            }
            
            Spacer()
            
            MainButtonView("Save") {}
                
        }.background(.page)
            .ignoresSafeArea()
            .padding(.horizontal)
            .sheet(isPresented: $vm.isShowingDatePicker) {
                SelectDateView(date: vm.userSelectedDate) { selectedDate in
                    vm.userSelectedDate = selectedDate
                    
                }
                .presentationDetents([.fraction(0.75), .large])
            }
            .sheet(isPresented: $vm.isShowingTimePicker) {
                SelectTimeView(date: vm.userSelectedDate) { selectedDate in
                    vm.userSelectedDate = selectedDate
                }.presentationDetents([.fraction(0.50), .large])
            }
    }
    
    func headerTextView(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 16, weight: .semibold))
                
    }
}

#Preview {
    AddNewTaskView()
}
