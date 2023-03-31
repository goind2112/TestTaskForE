//
//  TabBar.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 15.03.2023.
//

import SwiftUI

struct CustomTabBar: View {
    
    let tabs: [TabBarItemModel]
    @Binding var selection: TabBarItemModel
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Spacer()
                ForEach(tabs, id: \.self) { tab in
                    tabItem(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab)
                        }
                }
                Spacer()
            }
            .background{
                Rectangle()
                    .customeCornerRadius(25, corners: [.topLeft, .topRight])
                    .frame(height: 63)
                    .foregroundColor(R.Colors.TabBar.background)
            }
        }
    }
}

extension CustomTabBar {
    func tabItem(tab: TabBarItemModel) -> some View {
        VStack(spacing: 0) {
            switch tab {
            case .home:
                VStack(spacing: 0) {
                    if selection == tab {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                            .background{
                                Circle()
                                    .foregroundColor(R.Colors.CellElements.button)
                            }
                    } else {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                    }
                }
                .padding(.leading, 17)
                .padding(.top, 13)
                .padding(.bottom, 10)
            case .heart:
                VStack(spacing: 0) {
                    if selection == tab {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                            .background{
                                Circle()
                                    .foregroundColor(R.Colors.CellElements.button)
                            }
                    } else {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                    }
                }
                .padding(.leading, 31)
                .padding(.top, 13)
                .padding(.bottom, 10)
            case .shoppingСart:
                VStack(spacing: 0) {
                    if selection == tab {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                            .background{
                                Circle()
                                    .foregroundColor(R.Colors.CellElements.button)
                            }
                    } else {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                    }
                }
                .padding(.leading, 33.6)
                .padding(.top, 12)
                .padding(.bottom, 11)
            case .chat:
                VStack(spacing: 0) {
                    if selection == tab {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                            .background{
                                Circle()
                                    .foregroundColor(R.Colors.CellElements.button)
                            }
                    } else {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                    }
                }
                .padding(.leading, 35.9)
                .padding(.top, 13)
                .padding(.bottom, 10)
            case .tabProfile:
                VStack(spacing: 0) {
                    if selection == tab {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                            .background{
                                Circle()
                                    .foregroundColor(R.Colors.CellElements.button)
                            }
                    } else {
                        Image(uiImage: tab.image)
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(R.Colors.TabBar.button)
                            .frame(width: 15, height: 15)
                            .frame(width: 40, height: 40)
                    }
                }
                .padding(.leading, 30.2)
                .padding(.top, 13)
                .padding(.bottom, 10)
                .padding(.trailing, 11)
            }
        }
    }
    
    private func switchToTab (tab: TabBarItemModel) {
        withAnimation (.easeInOut) {
            selection = tab
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var tabs: [TabBarItemModel] = [.home,.heart,.shoppingСart,.chat,.tabProfile]
    static var previews: some View {
        CustomTabBar(tabs: tabs, selection: .constant(.home))
    }
}
