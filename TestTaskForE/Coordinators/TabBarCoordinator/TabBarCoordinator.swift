//
//  TabBarCoordinator.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import SwiftUI

final class TabBarCoordinator: ObservableObject {
    
    static let shared = TabBarCoordinator()
    
    //tabBar
    @Published var page1: Page1!
    @Published var heart: Heart!
    @Published var shoppingCart: ShoppingCart!
    @Published var chat: Chat!
    @Published var profile: Profile!
    
    private init() {
        self.page1 = .init()
        self.heart = .init()
        self.shoppingCart = .init()
        self.chat = .init()
        self.profile = .init()
    }
}
