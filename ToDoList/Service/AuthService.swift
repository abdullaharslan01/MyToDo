//
//  AuthService.swift
//  ToDoList
//
//  Created by abdullah on 12.02.2025.
//

import FirebaseAuth
import Foundation



class AuthService {

    static let shared = AuthService()
    private var auth = Auth.auth()

    func signOut() throws {

        try auth.signOut()

    }

    func getAuthenticatedUser() throws -> AuthDataResulModel {
        guard let user = auth.currentUser else {
            throw AuthErrorCode.userNotFound
        }

        return AuthDataResulModel(user: user)
    }

    @discardableResult
    func signIn(withEmail: String, password: String) async throws -> AuthDataResulModel {
        let result = try await auth.signIn(withEmail: withEmail, password: password)
        return AuthDataResulModel(user: result.user)
    }

    @discardableResult
    func createUser(withEmail: String, password: String) async throws -> AuthDataResulModel {
        let result = try await auth.createUser(withEmail: withEmail, password: password)
        return AuthDataResulModel(user: result.user)
    }

}
