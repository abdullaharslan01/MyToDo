//
//  OnboardView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct OnboardView: View {
    
    var onboardingData = onboardingSteps
    
    @State var currentPage: Int = 0
    
    @Namespace var onboard
    
    var body: some View {
        VStack {
            Spacer()
            TabView(selection: $currentPage) {
                ForEach(onboardingData) { onboardItem in
                    
                    OnboardImageInfoView(onboardItem: onboardItem )
                    
                }
            }.tabViewStyle(.page)
            
            HStack {
                
                HStack(spacing: 20) {
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            if currentPage < onboardingData.count - 1 {
                                currentPage += 1
                            }
                        }
                    } label: {
                                        
                        ZStack {
                            Circle()
                                .fill(.tdPrimary)
                                .frame(width: 60, height: 60)
                                            
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.tdBorder)
                                .font(.title3)
                        }
                                        
                    }
                    Button {
                        withAnimation(.easeInOut) {
                            currentPage = onboardingData.count - 1
                        }
                    } label: {
                        Text("Skip")
                            .foregroundStyle(.tdGray)
                            .font(.callout)
                            .bold()
                                            
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 10) {
                    ForEach(0 ..< onboardingData.count, id:\.self) { page in
                                      
                        Group {
                            if page == currentPage {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.tdPrimary)
                                    .frame(width: 40, height: 10)
                                    .transition(.scale)
                                    .matchedGeometryEffect(id: "indicator", in: onboard)
                                                                            
                            }
                            else {
                                Circle()
                                    .fill(.tdGray)
                                    .frame(width: 10, height: 10)
                            }
                        }.onTapGesture {
                            currentPage = page
                        }
                      
                    }
                }
                
            }
            
        }.padding(.horizontal)
            .padding(.bottom, 20)
            .animation(.easeInOut(duration: 0.3), value: currentPage)
            .sensoryFeedback(.selection, trigger: currentPage)
            .background(.white)
            
    }
}

#Preview {
    OnboardView()
}


