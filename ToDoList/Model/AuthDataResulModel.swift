//
//  AuthDataResulModel.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import Foundation
import FirebaseAuth

struct AuthDataResulModel: Codable {
    let uid: String
    var email: String?
    var photoUrl: String?
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }

}
