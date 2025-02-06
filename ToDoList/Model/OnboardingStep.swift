//
//  OnboardingStep.swift
//  ToDoList
//
//  Created by abdullah on 05.02.2025.
//

import Foundation

struct OnboardingStep: Identifiable {
    var id: Int
    var title: String
    var description: String
    var imageName: String

    
}

let onboardingSteps: [OnboardingStep] = [
    OnboardingStep(
        id:0,
        title: "Stay Organized and Keep Track of Your Tasks",
        description: "Easily create and manage your daily to-do list, prioritize your tasks, and track your progress to maintain a structured workflow.",
        imageName: "onboarding_1"
    ),
    OnboardingStep(
        id:1,
        title: "Manage Your Tasks Effortlessly and Stay in Control",
        description: "Mark tasks as completed, reorganize your list as needed, and ensure you stay on top of your responsibilities with ease.",
        imageName: "onboarding_2"
    ),
    OnboardingStep(
        id:2,
        title: "Achieve Your Goals and Boost Your Productivity",
        description: "Stay focused on your objectives, manage your plans efficiently, and take consistent steps toward achieving your long-term goals.",
        imageName: "onboarding_3"
    )
]
