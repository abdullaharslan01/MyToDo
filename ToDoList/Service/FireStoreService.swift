//
//  FireStoreService.swift
//  ToDoList
//
//  Created by abdullah on 13.02.2025.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore

@Observable
class FirestoreService {
    
    static let shared = FirestoreService()
    
    let userReferance = Firestore.firestore().collection("users")
    
    func userTaskCollection(userId id: String) -> CollectionReference {
        return userReferance.document(id).collection("tasks")
    }
    
    func getAuthenticatedUser() -> AuthDataResulModel? {
        
        do {
            let result = try AuthService.shared.getAuthenticatedUser()
            
            return result
            
        } catch {
            print(error)
            return nil
        }
    }
    
    func getUserId() -> String? {
        guard let currentUser = getAuthenticatedUser() else {
            return nil
        }
        return currentUser.uid
    }

    func createNewUser() async throws {
  
        guard let currentUserId = getUserId() else {
            throw AuthErrorCode.userNotFound
        }
        
        try userReferance.document(currentUserId).setData(from: currentUserId)
        
    }
    
    func updateCheckState(_ task: TodoItem) async throws {
        guard let currentUser = getAuthenticatedUser() else {
            throw AuthErrorCode.userNotFound
        }
        let updatedItem = TodoItem(id: task.id, title: task.title, date: task.date, notes: task.notes, categoryId: task.categoryId, isCompleted: !task.isCompleted)
        
        try userTaskCollection(userId: currentUser.uid).document(task.id).setData(from: updatedItem, merge: true)
        
    }
    
    func createNewTask(_ task: TodoItem) async throws {
        guard let currentUserId = getUserId() else {
            throw AuthErrorCode.userNotFound
        }
        
        try userTaskCollection(userId: currentUserId).document(task.id).setData(from: task)
        
    }
    
    func deleteTas(_ task: TodoItem) async throws {
        guard let currentUserId = getUserId() else {
            throw AuthErrorCode.userNotFound
        }
        
        try await userTaskCollection(userId: currentUserId).document(task.id).delete()
        
    }
    
    func gettAllTasks() async throws -> [TodoItem] {
        guard let currentUser = getAuthenticatedUser() else {
            throw AuthErrorCode.userNotFound
        }
        
        return try await userTaskCollection(userId: currentUser.uid).getDocumentsCustom(as: TodoItem.self)
        
    }
    
    func addTaskListener(completion: @escaping (_ todoItems: [TodoItem]) -> ()) -> ListenerRegistration? {
        
        guard let currentUserId = getUserId() else {
            completion([])
            return nil
        }
        
        return userTaskCollection(userId: currentUserId).addSnapshotListener { querySnapshot,
            _ in
            
            guard let documents = querySnapshot?.documents else { return }
            
            let result: [TodoItem] = documents.compactMap { document in
                try? document.data(as: TodoItem.self)
            }
            
            completion(result)
            
        }
    }
}

extension Query {
    func getDocumentsCustom<T>(as type: T.Type) async throws -> [T] where T: Codable {
        let snapshots = try await getDocuments()
        return try snapshots.documents.map { try $0.data(as: type) }
    }
}
