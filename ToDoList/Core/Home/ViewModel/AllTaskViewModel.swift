//
//  AllTaskViewModel.swift
//  ToDoList
//
//  Created by abdullah on 07.02.2025.
//

import Foundation
import Observation

@Observable
class AllTaskViewModel {
    var currentDate: Date
    var complated: [TodoItem]
    var unComplated: [TodoItem]


    init() {
        self.currentDate = .now
        self.complated = TodoItem.sampleData.filter { $0.isCompleted == true
        }
        self.unComplated = TodoItem.sampleData.filter { $0.isCompleted == false
        }
    }

}
