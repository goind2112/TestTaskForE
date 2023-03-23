//
//  FlashSaleModels.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 20.03.2023.
//

import Foundation

struct JsonModels: Codable {
    let productsFlashSale: [JsonModel]?
    let productsLatest: [JsonModel]?
    
    enum CodingKeys: String, CodingKey {
        case productsFlashSale = "flash_sale"
        case productsLatest = "latest"
    }
}

struct JsonModel: Codable {
    let category: String
    let name: String
    let price: Double
    let discount: Int?
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case category
        case name
        case price
        case discount
        case imageUrl = "image_url"
    }
}

