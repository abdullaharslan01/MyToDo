//
//  SideBarView.swift
//  ToDoList
//
//  Created by abdullah on 08.02.2025.
//

import SwiftUI

struct SideBarMenuView: View {

    @Binding var isShowing: Bool

    @Binding var selectedOption: SideMenuOptionModel
    
    @Namespace var animation
    
    var body: some View {
        ZStack {

            if isShowing {

                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing.toggle()
                        }
                    }

                HStack {
                    VStack {
                        
                        ZStack {
                            Image("allTaskHeader")
                                .resizable()
                            
                            SideBarHeaderView(gmail: "abdullaharslan1473@gmail.com")
                                .padding(.top, getSafeArea().top)
                                .padding(.leading)
                        }.frame(height: 200)
                        
                        VStack {
                            ForEach(SideMenuOptionModel.allCases, id: \.id) { option in
                                
                                SideBarMenuRowView(sideBarMenuItem: option, selectedOption: $selectedOption)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedOption = option
                                            isShowing.toggle()
                                        }
                                    }
                                    .padding(.trailing, 10)
                                    .matchedGeometryEffect(id: option.id, in: animation)
                                    
                            }
                        }
                        
                        Spacer()
                        
                    }.frame(width: 290)
                        .background(.page)
                        .ignoresSafeArea()
                    
                    Spacer()
                }.transition(.move(edge: .leading))
                    
                
            }
        }
    }
}

#Preview {
    SideBarMenuView(isShowing: .constant(true), selectedOption: .constant(.all))
}
