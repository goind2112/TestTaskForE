//
//  FlashSale.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 20.03.2023.
//

import Foundation
import SwiftUI

struct Product: Hashable {
    let category: String
    let name: String
    let price: String
    let discount: String?
    let image: UIImage
    let id = UUID()
}


