//
//  TabBarItemsPreferenceKey.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import SwiftUI

struct TabBarItemsPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItemModel] = []
    static func reduce (value: inout [TabBarItemModel], nextValue: () -> [TabBarItemModel]) {
        value += nextValue()
    }
}

struct TabBarItemsViewModifier: ViewModifier {
    
    let tab: TabBarItemModel
    
    @Binding var selection: TabBarItemModel
    
    func body(content: Content) -> some View {
        content
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
            .opacity(selection == tab ? 1.0 : 0.0)
    }
}
