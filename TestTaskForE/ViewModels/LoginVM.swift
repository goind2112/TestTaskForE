//
//  LoginVM.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 17.03.2023.
//

import Foundation

import SwiftUI

final class LoginVM: ObservableObject {
    // input
    @Published var firstName = ""
    @Published var password = ""
    @Published var isSecureField = true
    @ObservedObject private var realmService = RealmService.shared
    
    // output
    @Published var isValid = false
    @Published var mesage = ""
    
    func isValidUser(firstName: String, password: String) {
        if realmService.userArray.isEmpty {
            mesage = "Password or username do not match 😡"
        }
        for user in realmService.userArray {
            if user.password == password && user.firstName == firstName {
                determineTheCurrentUser(user: user)
                isValid = true
            } else {
                mesage = "Password or username do not match 😡"
            }
        }
    }
    
    private func determineTheCurrentUser(user: UserModel) {
        self.realmService.willСhange(currentUserModel: user)
    }
}
