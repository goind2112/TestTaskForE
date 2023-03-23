//
//  ImagePicker.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 17.03.2023.
//

import Foundation

import PhotosUI
import SwiftUI
import Combine

struct ImagePicker: UIViewControllerRepresentable {
    @ObservedObject private var profileVM = ProfileVM()
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator { Coordinator(self) }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) {[weak self] image, _ in
                    DispatchQueue.main.async {
                        self?.parent.profileVM.loadeImage(inputImage: image as? UIImage)
                    }
                }
            }
        }
    }
}