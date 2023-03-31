//
//  UserModel.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 16.03.2023.
//


import RealmSwift
import Foundation

class UserModel: Object, ObjectKeyIdentifiable {
    static let shared = UserModel()
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var email = ""
    @Persisted var password = ""
    @Persisted var firstName = ""
    @Persisted var lastName = ""
    @Persisted var image = Data()
    
    @Published var currentUser: UserModel?
    @Published var currentUserImage: Data? 
}
