//
//  TabBarItem.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import UIKit



enum TabBarItemModel: Hashable {
    
    case home, heart, shoppingСart, chat, tabProfile
    
    var image: UIImage {
        switch self {
        case .home:
            return UIImage(named:"home")!
        case .heart:
            return UIImage(named:"heart")!
        case .shoppingСart:
            return UIImage(named:"shoppingСart")!
        case .chat:
            return UIImage(named:"chat")!
        case .tabProfile:
            return UIImage(named:"tabProfile")!
        }
    }
}

