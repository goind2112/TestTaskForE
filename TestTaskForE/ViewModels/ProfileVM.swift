//
//  ProfileVM.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 17.03.2023.
//

import SwiftUI
import RealmSwift
import Combine
import Photos
import _PhotosUI_SwiftUI

final class ProfileVM: ObservableObject {
    // input
    @ObservedObject private var realmService = RealmService.shared
    @ObservedObject private var userModel = UserModel.shared
    @Published var imageSelection = [PhotosPickerItem]() {
        didSet {
            if !imageSelection.isEmpty {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }
    
    // output
    @Published var isPresented = false
    @Published var balanse: String = "$ 1593"
    @Published var profileImage: UIImage = R.Images.Profile.profile
    @Published var opacity = 0.0
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    func checkIsAuthorized() {
        let queue = DispatchQueue.main
        PHPhotoLibrary.requestAuthorization(for: .readWrite) {[weak self] status in
            switch status {
            case .notDetermined:
                queue.async { self?.isPresented = false }
            case .restricted:
                queue.async { self?.isPresented = false }
            case .denied:
                queue.async { self?.isPresented = false }
            case .authorized:
                queue.async { self?.isPresented = true }
            case .limited:
                queue.async { self?.isPresented = false }
            @unknown default:
                fatalError()
            }
        }
    }
    
    func logOut() {
        realmService.logOut()
    }
    
    func presentedPhotoLibrary() async {
        await PHPhotoLibrary.requestAuthorization(for: .readWrite)
    }
    
    func updateProfileImage(){
        userModel.$currentUserImage
            .receive(on: RunLoop.main)
            .map { data in
                guard let data = data else { return R.Images.Profile.profile }
                guard let image = UIImage(data: data) else { return R.Images.Profile.profile }
                return image
            }
            .assign(to: \.profileImage, on: self)
            .store(in: &cancellableSet)
    }
    
    func loadTransferable(from imageSelection: [PhotosPickerItem]) async throws {
        do {
            if let image = try await imageSelection.first!.loadTransferable(type: Data.self){
                DispatchQueue.main.async { self.loadeImage(inputImage: image) }
            }
        } catch  {
            print(error)
        }
    }
    
    private func loadeImage(inputImage: Data?) {
        DispatchQueue.main.async { [weak self] in
            guard let inputImage = inputImage else { return }
            self?.realmService.willСhange(image: inputImage)
            self?.updateProfileImage()
        }
    }
}
