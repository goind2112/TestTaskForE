//
//  Realm.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 16.03.2023.
//

import RealmSwift
import SwiftUI
import Combine

final class RealmService: ObservableObject {
    static let shared = RealmService()
    private(set) var localRealm: Realm?
    @Published private(set) var userArray: [UserModel] = []
    @Published private(set) var currentUser: UserModel?
    
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
                    currentUser = newUser
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
                    currentUser = user
                }
            }
        }
    }
    
    func willСhange(image: UIImage) {
        if let localRealm = localRealm {
            guard let currentUser = currentUser else { return }
            let currentUserId = currentUser.id
            do{
                let currentUser = localRealm.objects(UserModel.self).filter(NSPredicate(format: "id == %@", currentUserId))
                guard !currentUser.isEmpty else { return }
                
                try localRealm.write({
                    var dataImage = Data()
                    if let data = image.jpegData(compressionQuality: 0.9) {
                        dataImage = data
                    } else if let data = image.heic() {
                        dataImage = data
                    } else if let data = image.pngData() {
                        dataImage = data
                    }
                    currentUser[0].image = dataImage
                })
            } catch {
                print("Error updating task \(currentUserId) to Realm: \(error)")
            }
        }
    }
    
    func logOut() {
        currentUser = nil
    }
}
