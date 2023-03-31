//
//  CoordinatorView.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import SwiftUI

struct RootCoordinatorView: View {
    @StateObject private var coordinator = RootCoordinator.shared
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(screens: .signIn)
                .navigationDestination(for: Screens.self) { screen in
                    coordinator.build(screens: screen)
                        .navigationBarBackButtonHidden()
                }
                .alert(coordinator.alertText, isPresented: $coordinator.isPresented) {
                    Button("Ok", role: .cancel) {}
                }
        }
        .environmentObject(coordinator)
    }
}

struct RootCoordinatorView_Preview: PreviewProvider {
    static var previews: some View {
        RootCoordinatorView()
    }
}
