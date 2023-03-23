//
//  Modifires.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 13.03.2023.
//

import SwiftUI

struct TextFieldModifire: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .frame(height: 29)
            .background(R.Colors.backgroundTextField)
            .cornerRadius(100)
            .font(R.Fonts.montserrat(with: 16, .medium))
            .foregroundColor(R.Colors.textPlaceholder)
            .lineLimit(1)
    }
}
