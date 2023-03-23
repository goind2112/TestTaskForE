//
//  HomeCoordinatorView.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import SwiftUI

struct TabBarCoordinatorView: View {
    @ObservedObject var coordinator = TabBarCoordinator.shared
    
    @State var selection: TabBarItemModel
    var body: some View {
        CustomTabBarContainerView(selection: $selection) {
            coordinator.page1
                .tabBarItem(tab: .home, selection: $selection)
            
            coordinator.heart
                .tabBarItem(tab: .heart, selection: $selection)
            
            coordinator.shoppingCart
                .tabBarItem(tab: .shoppingСart, selection: $selection)
            
            coordinator.chat
                .tabBarItem(tab: .chat, selection: $selection)
            
            coordinator.profile
                .tabBarItem(tab: .tabProfile, selection: $selection)
        }
    }
}

struct TabBarCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarCoordinatorView(coordinator: TabBarCoordinator.shared, selection: .home)
    }
}
