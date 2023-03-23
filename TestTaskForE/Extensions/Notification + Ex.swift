//
//  + Ex.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 13.03.2023.
//

import UIKit

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
