//
//  ProfileVM.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 17.03.2023.
//

import SwiftUI
import RealmSwift
import Combine

final class ProfileVM: ObservableObject {
    
    // input
    @ObservedObject private var realmService = RealmService.shared
    
    // output
    @Published var balanse: String = "$ 1593"
    @Published var profileImage: UIImage = R.Images.Profile.profile
    @Published var opacity = 0.0 
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func logOut() {
        realmService.logOut()
    }
    
    func updateProfileImage(){
        realmService.$currentUser
            .receive(on: RunLoop.main)
            .map { user in
                guard let user = user else { return R.Images.Profile.profile }
                guard let image = UIImage(data: user.image) else { return R.Images.Profile.profile }
                return image
            }
            .assign(to: \.profileImage, on: self)
            .store(in: &cancellableSet)
    }
    
    func loadeImage(inputImage: UIImage?) {
        DispatchQueue.main.async { [weak self] in
            guard let inputImage = inputImage else { return }
            self?.realmService.willСhange(image: inputImage)
            self?.updateProfileImage()
        }
    }
}

