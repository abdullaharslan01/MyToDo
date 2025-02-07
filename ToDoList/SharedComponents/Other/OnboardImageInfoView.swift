//
//  OnboardImageInfoView.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import SwiftUI

struct OnboardImageInfoView: View {
    
    let onboardItem: OnboardingStep
    
    var body: some View {
        VStack {
            Image(onboardItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .padding(.bottom, 50)
                .transition(.opacity)
            
            VStack(spacing: 18) {
                Text(onboardItem.title)
                    .foregroundStyle(.tdBody)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .transition(.slide)
                
                Text(onboardItem.description)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.tdPrimaryText)
                    .font(.callout)
                    .transition(.slide)
                
            }
            
        }.tag(onboardItem.id)
    }
}
