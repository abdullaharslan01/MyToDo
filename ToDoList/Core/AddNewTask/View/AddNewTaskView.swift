//
//  AddNewTaskView.swift
//  ToDoList
//
//  Created by abdullah on 06.02.2025.
//

import SwiftUI

enum FieldState: Hashable {
    case title
    case note
}

struct AddNewTaskView: View {
    
    @State var vm = AddNewTaskViewModel()
    
    @State private var scrollPosition = ScrollPosition()
        
    @FocusState var focused: FieldState?
    @Environment(Router.self) private var router
    var headerView: some View {
        HeaderView(title: "Add New Task") {
            router.navigateBack()
        }

    }
    
    var taskTitleSection: some View {
        VStack {
            headerTextView("Task Title")
                .frame(maxWidth: .infinity, alignment: .leading)
                            
            TextField("Task Title", text: $vm.taskTitle)
                .focused($focused, equals: .title)
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
                .focused($focused, equals: .note)
                .padding()
                .autocorrectionDisabled()
                .foregroundStyle(.tdPrimaryText)
                .textEditorStyle(.plain)
                .frame(height: 250)
                .background(Color.white)
                .submitLabel(.done)
                .clipShape(.rect(cornerRadius: 6))
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            focused = nil
                            scrollPosition.scrollTo(y: 0)
                        }
                    }
                }
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            headerView
       
            ScrollView {
                VStack(spacing: 20) {
                    taskTitleSection
                    cateegorySection
                    selectDateTimeSection
                  
                    addNoteSection
                           
                    Rectangle()
                        .fill(.clear)
                        
                        .frame(height: focused == nil ? 1 : 300)
                        
                }.ignoresSafeArea(.keyboard)
                    .scrollTargetLayout()
            }.scrollPosition($scrollPosition)
                .animation(.default, value: scrollPosition)
                .scrollIndicators(.hidden)
                .onChange(of: focused) { _, newValue in
                    if newValue == .note {
                        withAnimation {
                            scrollPosition.scrollTo(y: 250)
                        }
                    } else {
                        scrollPosition.scrollTo(y: 0)
                    }
                }
            
        }.background(.page)
            
            .safeAreaInset(edge: .bottom, content: {
                MainButtonView("Save") {}
                    .padding(.vertical, 50)
            })
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
        .environment(Router())
}
