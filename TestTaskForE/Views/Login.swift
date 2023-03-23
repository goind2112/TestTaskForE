//
//  Login.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 13.03.2023.
//

import SwiftUI
import Combine

struct Login: View {
    private enum Fields {
        case firstName, lastName, email
    }
    
    @FocusState private var focusedField: Fields?
    @State private var keyboardHeight: CGFloat = 0
    
    @ObservedObject private var loginVM = LoginVM()
    
    
    @EnvironmentObject private var rootCoordinator: RootCoordinator
    
    var body: some View {
        VStack(spacing: 0) {
            Text(R.Strings.Login.title)
                .font(
                    R.Fonts.montserrat(with: 30,.semiBold)
                )
                .lineLimit(1)
                .padding(.top, 128)
                .foregroundColor(R.Colors.textBlack)
            
            Section {
                TextField("", text: $loginVM.firstName)
                    .textFieldModifire()
                    .padding(.top, 80)
                    .placeholder(when: loginVM.firstName.isEmpty) {
                        Text(R.Strings.Login.firstName).foregroundColor(R.Colors.textPlaceholder)
                            .padding(.top, 77)
                            .font(R.Fonts.montserrat(with: 13,.medium))
                            .onTapGesture { focusedField = .firstName }
                    }
                    .focused($focusedField, equals: .firstName)
                
                ZStack {
                    if loginVM.isSecureField {
                        SecureField("", text: $loginVM.password)
                            .textFieldModifire()
                            .textInputAutocapitalization(.never)
                            .placeholder(when: loginVM.password.isEmpty) {
                                Text(R.Strings.Login.password).foregroundColor(R.Colors.textPlaceholder)
                                    .padding(.bottom, 3)
                                    .font(R.Fonts.montserrat(with: 13,.medium))
                                    .onTapGesture { focusedField = .lastName }
                            }
                            .focused($focusedField, equals: .lastName)
                    } else {
                        TextField("", text: $loginVM.password)
                            .textFieldModifire()
                            .textInputAutocapitalization(.never)
                            .placeholder(when: loginVM.password.isEmpty) {
                                Text(R.Strings.Login.password).foregroundColor(R.Colors.textPlaceholder)
                                    .padding(.bottom, 3)
                                    .font(R.Fonts.montserrat(with: 13,.medium))
                                    .onTapGesture { focusedField = .lastName }
                            }
                            .focused($focusedField, equals: .lastName)
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            loginVM.isSecureField.toggle()
                        } label: {
                            if loginVM.isSecureField {
                                Image(uiImage: R.Images.Login.eye)
                                    .padding(.vertical, 7)
                                    .padding(.trailing, 15)
                            } else {
                                Image(uiImage: R.Images.Login.eye)
                                    .renderingMode(.template)
                                    .padding(.vertical, 7)
                                    .padding(.trailing, 15)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                .padding(.top, 35)
            }
            .padding(.horizontal, 43)
            
            Button {
                focusedField = nil
                loginVM.isValidUser(firstName: loginVM.firstName, password: loginVM.password)
                if loginVM.isValid {
                    rootCoordinator.show(screen: .tabBar(tab: .home))
                } else {
                    rootCoordinator.show(isPresented: !loginVM.mesage.isEmpty, alertText: loginVM.mesage)
                }
            } label: {
                Text(R.Strings.Login.loginButton)
                    .font(R.Fonts.montserrat(with: 16,.bold))
                    .frame(maxWidth: .infinity, minHeight: 46, idealHeight: 46)
            }
            .foregroundColor(R.Colors.textButtonWhite)
            .background(R.Colors.buttonViolet)
            .cornerRadius(15)
            .padding(.top, 99)
            .padding(.horizontal, 43)
            .padding(.bottom, keyboardHeight/2)
            
            Spacer()
        }
        .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
        .background(R.Colors.background)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
