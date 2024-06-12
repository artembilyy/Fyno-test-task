//
//  UISheetPresentationController+Detent.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

extension UISheetPresentationController.Detent {
    static func small() -> UISheetPresentationController.Detent {
        custom { context in
            context.maximumDetentValue * 0.25
        }
    }
}

extension UISheetPresentationController.Detent.Identifier {
    static let small = UISheetPresentationController.Detent.Identifier("small")
}
