//
//  Realm.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 16.03.2023.
//

import RealmSwift
import SwiftUI

final class RealmService: ObservableObject {
    static let shared = RealmService()
    private(set) var localRealm: Realm?
    @ObservedObject private var userModel = UserModel.shared
    @Published private(set) var userArray: [UserModel] = []
    
    private init () {
        openRealm()
        getUsers()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
            
        } catch {
            print("Error opening Realme: \(error)")
        }
    }
    
    func addUser(user: UserModel) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newUser = user
                    userModel.currentUser = newUser
                    localRealm.add(newUser)
                    getUsers()
                    print("Added new user: \(newUser)")
                }
            } catch {
                print("Error adding user: \(error)")
            }
        }
    }
    
    func getUsers() {
        if let localRealm = localRealm {
            let allUsers = localRealm.objects(UserModel.self)
            userArray = []
            allUsers.forEach { user in
                userArray.append(user)
            }
        }
    }
    
    func willСhange(currentUserModel: UserModel) {
        if let localRealm = localRealm {
            let allUsers = localRealm.objects(UserModel.self)
            allUsers.forEach { user in
                if currentUserModel.id == user.id {
                    userModel.currentUser = user
                    userModel.currentUserImage = userModel.currentUser?.image
                }
            }
        }
    }
    
    func willСhange(image: Data) {
        if let localRealm = localRealm {
            guard let currentUser = userModel.currentUser else { return }
            let currentUserId = currentUser.id
            do{
                let currentUser = localRealm.objects(UserModel.self).filter(NSPredicate(format: "id == %@", currentUserId))
                guard !currentUser.isEmpty else { return }
                
                try localRealm.write({
                    let dataImage = image
                    currentUser[0].image = dataImage
                    userModel.currentUserImage = dataImage
                })
            } catch {
                print("Error updating task \(currentUserId) to Realm: \(error)")
            }
        }
    }
    
    func logOut() {
        userModel.currentUser = nil
        userModel.currentUserImage = nil
    }
}
