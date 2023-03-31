//
//  Coordinator.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import SwiftUI

enum Screens: Hashable {
    case login, signIn, tabBar(tab: TabBarItemModel)
}

final class RootCoordinator: ObservableObject {
    static let shared = RootCoordinator()
    
    private init() {}
    
    @Published var path = NavigationPath()
    @Published var screens: Screens?
    @Published var isPresented: Bool = false
    @Published var alertText: String = ""
    
    @Published var isPresentedSheet: Bool = false
    
    private var tabBarCoordinator = TabBarCoordinator.shared
    
    func show(screen: Screens) {
        path.append(screen)
    }
    
    func back() {
        path.removeLast()
    }
    
    func backToRoot() {
        path.removeLast(path.count)
    }
    
    func show(isPresented: Bool ,alertText: String) {
        self.isPresented = isPresented
        self.alertText = alertText
    }
    
    @ViewBuilder
    func build(screens: Screens) -> some View {
        switch screens {
        case .login:
            Login()
        case .signIn:
            SignIn()
        case .tabBar(tab: .home):
            TabBarCoordinatorView(coordinator: tabBarCoordinator, selection: .home)
        case .tabBar(tab: .heart):
            TabBarCoordinatorView(coordinator: tabBarCoordinator, selection: .heart)
        case .tabBar(tab: .shoppingСart):
            TabBarCoordinatorView(coordinator: tabBarCoordinator, selection: .shoppingСart)
        case .tabBar(tab: .chat):
            TabBarCoordinatorView(coordinator: tabBarCoordinator, selection: .chat)
        case .tabBar(tab: .tabProfile):
            TabBarCoordinatorView(coordinator: tabBarCoordinator, selection: .tabProfile)
        }
    }
}

