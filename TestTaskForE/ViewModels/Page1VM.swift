//
//  Page1VM.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 18.03.2023.
//

import SwiftUI
import RealmSwift
import Combine

final class Page1VM: ObservableObject {
    
    // input
    @ObservedObject private var realmService = RealmService.shared
    @ObservedObject private var jsonParser = JsonParser.shared
    
    // output
    @Published var profileImage: UIImage = R.Images.Profile.profile
    @Published var products: [Product] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    //to do: почени profileImage
    init() {
        realmService.$currentUser
            .receive(on: RunLoop.main)
            .map { user in
                guard let user = user else { return R.Images.Profile.profile }
                guard let image = UIImage(data: user.image) else { return R.Images.Profile.profile }
                return image
            }
            .assign(to: \.profileImage, on: self)
            .store(in: &cancellableSet)
        
        jsonParser.$images
            .receive(on: RunLoop.main)
            .map { [weak self] images in
                self?.initProducts(self?.jsonParser.jsonModels ?? [JsonModel](),
                                   images: images) ?? [Product]()
            }
            .assign(to: \.products, on: self)
            .store(in: &cancellableSet)
    }
    
    private func initProducts(_ jsonModels: [JsonModel], images: [UIImage]) -> [Product] {
        var products = [Product]()
        for index in 0..<jsonModels.count {
            let price = String(format: "%.03f", jsonModels[index].price)
            var discount: String? = nil
            
            if let discountInt = jsonModels[index].discount {
                discount = "\(discountInt)"
            }
            
            products.append(Product(category: jsonModels[index].category,
                                     name: jsonModels[index].name,
                                     price: price,
                                     discount: discount,
                                     image: images[index]))
        }
        return products
    }
}
