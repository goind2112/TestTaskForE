//
//  ContentView.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 13.03.2023.
//

import SwiftUI

struct SignIn: View {
    private enum Fields {
        case firstName, lastName, email
    }
    
    @FocusState private var focusedField: Fields?
    
    @ObservedObject private var signInVM = SignInVM()
    
    @EnvironmentObject private var rootCoordinator: RootCoordinator
    
    var body: some View {
        VStack(spacing: 0) {
            Text(R.Strings.SignIn.title)
                .font(
                    R.Fonts.montserrat(with: 30,.semiBold)
                )
                .padding(.top, 128)
                .foregroundColor(R.Colors.textBlack)
            
            Section {
                TextField("", text: $signInVM.firstName)
                    .textFieldModifire()
                    .padding(.top, 77)
                    .placeholder(when: signInVM.firstName.isEmpty) {
                        Text(R.Strings.SignIn.firstName).foregroundColor(R.Colors.textPlaceholder)
                            .padding(.top, 74)
                            .font(R.Fonts.montserrat(with: 13,.medium))
                            .onTapGesture { focusedField = .firstName }
                    }
                    .focused($focusedField, equals: .firstName)
                
                TextField("", text: $signInVM.lastName)
                    .textFieldModifire()
                    .padding(.top, 35)
                    .placeholder(when: signInVM.lastName.isEmpty) {
                        Text(R.Strings.SignIn.lastName).foregroundColor(R.Colors.textPlaceholder)
                            .padding(.top, 32)
                            .font(R.Fonts.montserrat(with: 13,.medium))
                            .onTapGesture { focusedField = .lastName }
                    }
                    .focused($focusedField, equals: .lastName)
                    
                TextField("", text: $signInVM.email)
                    .textFieldModifire()
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding(.top, 35)
                    .placeholder(when: signInVM.email.isEmpty) {
                        Text(R.Strings.SignIn.email).foregroundColor(R.Colors.textPlaceholder)
                            .padding(.top, 32)
                            .font(R.Fonts.montserrat(with: 13,.medium))
                            .onTapGesture { focusedField = .email }
                    }
                    .focused($focusedField, equals: .email)
            }
            .padding(.horizontal, 43)
            
            Button {
                focusedField = nil
                signInVM.checkIsValidUser(email: signInVM.email,
                                          firstName: signInVM.firstName,
                                          lastName: signInVM.lastName)
                
                if signInVM.isValid {
                    signInVM.writeToDB(email: signInVM.email,
                                       firstName: signInVM.firstName,
                                       lastName: signInVM.lastName)
                    
                    rootCoordinator.show(screen: .tabBar(tab: .home))
                } else {
                    
                    rootCoordinator.show(isPresented: !signInVM.mesage.isEmpty, alertText: signInVM.mesage)
                }
            } label: {
                Text(R.Strings.SignIn.title)
                    .font(R.Fonts.montserrat(with: 16,.bold))
                    .frame(maxWidth: .infinity, minHeight: 46, idealHeight: 46)
            }
            .foregroundColor(R.Colors.textButtonWhite)
            .background(R.Colors.buttonViolet)
            .cornerRadius(15)
            .padding(.top, 35)
            .padding(.horizontal, 43)
            
            HStack(spacing: 0) {
                Text(R.Strings.SignIn.thereIsAnAccount)
                    .font(R.Fonts.montserrat(with: 10, .medium))
                    .foregroundColor(R.Colors.textPlaceholder)
                    .padding(.top, 18)
                    .padding(.leading, 43)
                Button {
                    focusedField = nil
                    rootCoordinator.show(screen: .login)
                } label: {
                    Text(R.Strings.SignIn.loginButton)
                        .foregroundColor(R.Colors.buttonViolet)
                        .font(R.Fonts.montserrat(with: 10, .medium))
                        .padding(.top, 18)
                        .padding(.leading, 8)
                    Spacer()
                }
            }
            
            Button {
                rootCoordinator.show(screen: .tabBar(tab: .home))
            } label: {
                HStack(spacing: 0) {
                    Image(uiImage: R.Images.SignIn.google)
                        .resizable()
                        .frame(width: 23.83, height: 24.22)
                    Text(R.Strings.SignIn.google)
                        .font(R.Fonts.montserrat(with: 13, .medium))
                        .foregroundColor(R.Colors.textBlack)
                        .padding(.top, 3)
                        .padding(.leading, 11)
                    Spacer()
                }
            }
            .padding(.top, 37)
            .padding(.horizontal, 99)
            
            Button {
                rootCoordinator.show(screen: .tabBar(tab: .home))
            } label: {
                HStack(spacing: 0) {
                    Image(uiImage: R.Images.SignIn.apple)
                        .resizable()
                        .frame(width: 18.38, height: 21.87)
                    Text(R.Strings.SignIn.apple)
                        .font(R.Fonts.montserrat(with: 13, .medium))
                        .foregroundColor(R.Colors.textBlack)
                        .padding(.top, 4)
                        .padding(.leading, 14)
                    Spacer()
                }
            }
            .padding(.top, 38)
            .padding(.horizontal, 99)
            Spacer()
            
        }
        .background(R.Colors.background)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
