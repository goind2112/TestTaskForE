//
//  CustomTabBarContainerView.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItemModel
    let content: Content
    @State private var tabs: [TabBarItemModel] = []
    
    init (selection: Binding<TabBarItemModel>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
                VStack(spacing: 0) {
                    Spacer()
                    CustomTabBar(tabs: tabs, selection: $selection)
                }
            }
        }
        .background {
            Color.white
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
    static let tabs: [TabBarItemModel] = [.home,.heart,.shoppingСart,.chat,.tabProfile]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(.home)) {
            Color.blue
        }
    }
}
