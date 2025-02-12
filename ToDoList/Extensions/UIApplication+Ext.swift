//
//  UIApplication+Ext.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
         to: nil, from: nil, for: nil)
    }
}

