//
//  View.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 13.03.2023.
//

import SwiftUI

extension View {
    func textFieldModifire() -> some View {
        modifier(TextFieldModifire())
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .center,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                self
                placeholder().opacity(shouldShow ? 1 : 0)
            }
        }
    
    func customeCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func tabBarItem(tab: TabBarItemModel, selection: Binding<TabBarItemModel>) -> some View {
        modifier(TabBarItemsViewModifier(tab: tab, selection: selection))
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

