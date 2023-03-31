//
//  Profile.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 13.03.2023.
//

import SwiftUI
import RealmSwift
import Photos
import _PhotosUI_SwiftUI

struct Profile: View {
    
    // Changing the color and font in NavigationView
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Montserrat-Bold", size: 19)!]
    }
    
    @ObservedObject private var profileVM = ProfileVM()
    @EnvironmentObject private var rootCoordinator: RootCoordinator
    @State private var image: UIImage?
    
    let readWriteStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
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
                        profileVM.checkIsAuthorized()
                        rootCoordinator.show(isPresented: !profileVM.isPresented, alertText: "To change your profile picture, go to Settings -> TestTaskForE -> Photos -> select All Photos")
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
                
                SettingsAndInformation(profileVM: profileVM)
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
        .photosPicker(isPresented: $profileVM.isPresented, selection: $profileVM.imageSelection, maxSelectionCount: 1, matching: .images)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
