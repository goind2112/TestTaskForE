//
//  SignInVM.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 16.03.2023.
//

import SwiftUI

final class SignInVM: ObservableObject {
    
    // input
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @ObservedObject private var realmService = RealmService.shared
    
    // output
    @Published var isValid = false
    @Published var mesage = ""
    
    func checkIsValidUser(email: String, firstName: String, lastName: String) {
        isValid =  checkIsValidFirstName(firstName: firstName) &&
        checkIsValidLastName(lastName: lastName) &&
        firstNameIsInDB(firstName: firstName) &&
        checkIsValidEmail(email: email)
    }
    
    func writeToDB(email: String, firstName: String, lastName: String, password: String = "00000000") {
        guard !email.isEmpty, !firstName.isEmpty, !lastName.isEmpty else { return }
        let user = UserModel()
        user.email = email
        user.lastName = lastName
        user.firstName = firstName
        user.password = password
        
        self.realmService.addUser(user: user)
    }
    
    private func checkIsValidEmail(email: String) -> Bool {
        return emailIsInDB(email: email) && isValidEmail(email)
    }
    
    private func emailIsInDB(email: String) -> Bool {
        var result = true
        for user in realmService.userArray {
            if user.email == email {
                result = false
            }
        }
        
        if !result {
            mesage = "User with this email address is registered 😡"
        }
        
        return result
    }
    
    private func firstNameIsInDB(firstName: String) -> Bool {
        var result = true
        for user in realmService.userArray {
            if user.firstName == firstName {
                result = false
            }
        }
        
        if !result {
            mesage = "User with this first name is already registered 😡"
        }
        
        return result
    }
    
    private func isValidEmail(_ email: String?) -> Bool {
        var pattern = " "
        pattern = "^[A-Z0-9_\\.%\\+\\-\\']+@(?:[A-Z0-9\\-]+\\.)+(?:[A-Z]{2,13})$"
        var regex: NSRegularExpression? = nil
        do {
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        } catch {
        }
        let matches = regex?.matches(in: email ?? "", options: NSRegularExpression.MatchingOptions(rawValue: NSRegularExpression.MatchingFlags.progress.rawValue), range: NSRange(location: 0, length: email?.count ?? 0))
        let result = (matches?.count ?? 0) > 0
        if !result {
            mesage = "The email address is badly formatted 😡"
        }
        return result
    }
    
    private func checkIsValidFirstName(firstName: String) -> Bool {
        if firstName != "" {
            return true
        } else {
            mesage = "Field: \"\(R.Strings.SignIn.firstName)\" is required 😡"
            return false
        }
    }
    
    private func checkIsValidLastName(lastName: String)-> Bool {
        if lastName != "" {
            return true
        } else {
            mesage = "Field: \"\(R.Strings.SignIn.lastName)\" is required 😡"
            return false
        }
    }
}
