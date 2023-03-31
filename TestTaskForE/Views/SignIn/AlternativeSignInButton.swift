//
//  AlternativeSignInButton.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 31.03.2023.
//

import SwiftUI

struct AlternativeSignInButton: View {
    @EnvironmentObject private var rootCoordinator: RootCoordinator
    
    var body: some View {
        VStack(spacing: 0){
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
        }
    }
}

struct AlternativeSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        AlternativeSignInButton()
    }
}
