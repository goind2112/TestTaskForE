//
//  SettingsAndInformation.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 31.03.2023.
//

import SwiftUI

struct SettingsAndInformation: View {
    @ObservedObject var profileVM: ProfileVM
    @EnvironmentObject private var rootCoordinator: RootCoordinator
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 0) {
                Button {
                    
                } label: {
                    profileButtonLabel(first: R.Images.Profile.card,
                                       firstText: R.Strings.Profile.tradeStore,
                                       last: R.Images.Profile.rightArrow, distanceFromImageToText: 7.7)
                }
                .padding(.trailing, 45.5)
                .padding(.bottom, 25.7)
                Button {
                    
                } label: {
                    profileButtonLabel(first: R.Images.Profile.card,
                                       firstText: R.Strings.Profile.paymentMethod,
                                       last: R.Images.Profile.rightArrow, distanceFromImageToText: 8.6)
                }
                .padding(.trailing, 45.5)
                .padding(.bottom, 25.3)
                Button {
                    
                } label: {
                    profileButtonLabel(first: R.Images.Profile.card,
                                       firstText: R.Strings.Profile.balance,
                                       lastText: profileVM.balanse, distanceFromImageToText: 9.7)
                }
                .padding(.trailing, 44.2)
            }
            .padding(.top, 13.8)
            .padding(.leading, 32)
            .padding(.bottom, 25.3)
            
            VStack(spacing: 20.3) {
                Button {
                    
                } label: {
                    profileButtonLabel(first: R.Images.Profile.card,
                                       firstText: R.Strings.Profile.tradeHistory,
                                       last: R.Images.Profile.rightArrow, distanceFromImageToText: 9)
                }
                .padding(.trailing, 47.5)
                Button {
                    
                } label: {
                    profileButtonLabel(first: R.Images.Profile.restore,
                                       firstText: R.Strings.Profile.restorePurchase,
                                       last: R.Images.Profile.rightArrow, distanceFromImageToText: 7.4)
                }
                .padding(.trailing, 46.5)
                Button {
                    
                } label: {
                    profileButtonLabel(first: R.Images.Profile.help,
                                       firstText: R.Strings.Profile.help, distanceFromImageToText: 8.7)
                }
                Button {
                    profileVM.logOut()
                    // Encountered a bug: the view moved down when returning to the root view, so we first clear the NavigationPath, and then go to the root view
                    rootCoordinator.backToRoot()
                    rootCoordinator.show(screen: .signIn)
                } label: {
                    profileButtonLabel(first: R.Images.Profile.logOut,
                                       firstText: R.Strings.Profile.logOut, distanceFromImageToText: 8)
                }
                .padding(.bottom, 77)
            }
            .padding(.leading, 28)
        }
    }
}

extension SettingsAndInformation {
    private func profileButtonLabel(first: UIImage, firstText: String, last: UIImage? = nil, lastText: String? = nil, distanceFromImageToText: CGFloat) -> some View {
        HStack(spacing: 0) {
            Image(uiImage: first)
                .resizable()
                .frame(width: 40, height: 40.6)
                .padding(.trailing, distanceFromImageToText)
            Text(firstText)
                .font(R.Fonts.montserrat(with: 10,.medium))
                .foregroundColor(R.Colors.textBlack)
                .padding(.bottom, 13)
                .padding(.top, 18)
            Spacer()
            
            if let lastImage = last {
                Image(uiImage: lastImage)
                    .resizable()
                    .frame(width: 5.5, height: 10.15)
            }
            
            if let lastText = lastText {
                Text(lastText)
                    .font(R.Fonts.montserrat(with: 10,.medium))
                    .foregroundColor(R.Colors.textBlack)
            }
        }
    }
}

struct SettingsAndInformation_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAndInformation(profileVM: ProfileVM())
    }
}
