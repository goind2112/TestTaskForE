//
//  Profile.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 13.03.2023.
//

import SwiftUI
import RealmSwift

struct Profile: View {
    
    // Changing the color and font in NavigationView
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 19)!]
    }
    
    @ObservedObject private var profileVM = ProfileVM()
    @EnvironmentObject private var rootCoordinator: RootCoordinator
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    Image(uiImage: profileVM.profileImage)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(R.Colors.Profile.border, lineWidth: 1)
                        }
                        .padding(.bottom, 8)
                    Button {
                        rootCoordinator.isPresentedSheet.toggle()
                    } label: {
                        Text(R.Strings.Profile.changePhoto)
                            .font(R.Fonts.montserrat(with: 8))
                            .foregroundColor(R.Colors.textPlaceholder)
                    }
                    
                    Text(R.Strings.Profile.fullName)
                        .font(R.Fonts.montserrat(with: 12, .bold))
                        .foregroundColor(R.Colors.Profile.fullName)
                        .padding(.top, 20)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image(uiImage: R.Images.Profile.uploadButton)
                                .resizable()
                                .frame(width: 10, height: 12.6)
                                .padding(.horizontal, 40)
                            Text(R.Strings.Profile.uploadButton)
                                .font(R.Fonts.montserrat(with: 13,.bold))
                                .lineLimit(1)
                                .frame(alignment: .center)
                                .padding(.trailing, 100)
                        }
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    }
                    .foregroundColor(R.Colors.textButtonWhite)
                    .background(R.Colors.buttonViolet)
                    .cornerRadius(15)
                    .padding(.horizontal, 43)
                    .padding(.top, 38)
                }
                .background(R.Colors.background)
                
                ScrollView(showsIndicators: false){
                    VStack(spacing: 25) {
                        Button {
                            
                            print(Thread.current)
                        } label: {
                            profileButtonLabel(first: R.Images.Profile.card,
                                               firstText: R.Strings.Profile.tradeStore,
                                               last: R.Images.Profile.rightArrow)
                        }
                        
                        Button {
                            
                        } label: {
                            profileButtonLabel(first: R.Images.Profile.card,
                                               firstText: R.Strings.Profile.paymentMethod,
                                               last: R.Images.Profile.rightArrow)
                        }
                        
                        Button {
                            
                        } label: {
                            profileButtonLabel(first: R.Images.Profile.card,
                                               firstText: R.Strings.Profile.balance,
                                               lastText: profileVM.balanse)
                        }
                    }
                    .padding(.top, 13)
                    .padding(.leading, 32)
                    .padding(.trailing, 45)
                    .padding(.bottom, 25)
                    
                    VStack(spacing: 20) {
                        Button {
                            
                        } label: {
                            profileButtonLabel(first: R.Images.Profile.card,
                                               firstText: R.Strings.Profile.tradeHistory,
                                               last: R.Images.Profile.rightArrow)
                        }
                        
                        Button {
                            
                        } label: {
                            profileButtonLabel(first: R.Images.Profile.restore,
                                               firstText: R.Strings.Profile.restorePurchase,
                                               last: R.Images.Profile.rightArrow)
                        }
                        
                        Button {
                            
                        } label: {
                            profileButtonLabel(first: R.Images.Profile.help,
                                               firstText: R.Strings.Profile.help)
                        }
                        Button {
                            profileVM.logOut()
                            // Encountered a bug: the view moved down when returning to the root view, so we first clear the NavigationPath, and then go to the root view
                            rootCoordinator.backToRoot()
                            rootCoordinator.show(screen: .signIn)
                        } label: {
                            profileButtonLabel(first: R.Images.Profile.logOut,
                                               firstText: R.Strings.Profile.logOut)
                        }
                        .padding(.bottom, 63)
                    }
                    .padding(.leading, 28)
                    .padding(.trailing, 47)
                }
                .background(R.Colors.background)
                Spacer()
            }
            .onAppear(perform: { profileVM.updateProfileImage() })
            .navigationTitle(R.Strings.Profile.title)
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("worck")
                    } label: {
                        Image(uiImage: R.Images.Profile.leftArrow)
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                }
            }
        }
    }
}

extension Profile {
    private func profileButtonLabel(first: UIImage, firstText: String, last: UIImage? = nil, lastText: String? = nil) -> some View {
        HStack(spacing: 0) {
            Image(uiImage: first)
                .resizable()
                .frame(width: 40, height: 40.9)
                .padding(.trailing, 7.8)
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
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
