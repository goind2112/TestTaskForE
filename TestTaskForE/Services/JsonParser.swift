//
//  JsonParser.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 20.03.2023.
//

import Foundation
import SwiftUI

final class JsonParser: ObservableObject {
    static let shared = JsonParser()
    
    @Published var jsonModels = [JsonModel]()
    @Published var images = [UIImage]()
    
    private var imageURL = [URL]()
    private let arrayStringURL = ["https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac",
                                  "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"]
    
    private init() {
        Task {
            await loadProducts()
        }
    }
    
    private func loadProducts() async {
        await parseFlashSaleModels(stringsURL: arrayStringURL)
        await loadImage(urls: imageURL)
    }
    
    private func parseFlashSaleModels(stringsURL: [String]) async {
        
        for stringURL in stringsURL {
            guard let url = URL(string: stringURL) else { return }
    
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let produkts = try! JSONDecoder()
                    .decode(JsonModels.self, from: data)
                
                if let productsFlashSale = produkts.productsFlashSale {
                    jsonModels += productsFlashSale
                    
                    for productFlashSale in productsFlashSale {
                        guard let url = URL(string: productFlashSale.imageUrl) else { return }
                        imageURL.append(url)
                    }
                    
                } else if let productsLatest = produkts.productsLatest {
                    jsonModels += productsLatest
                    
                    for productLatest in productsLatest {
                        guard let url = URL(string: productLatest.imageUrl) else { return }
                        imageURL.append(url)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
    
    private func loadImage(urls: [URL]) async {
        var inputImages = [UIImage]()
        for url in urls {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let image = UIImage(data: data) else { return }
                inputImages.append(image)
            } catch {
                print(error)
            }
        }
        images = inputImages
    }
}

