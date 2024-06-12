//
//  UIViewController+Extension.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

extension UIViewController {
    func removeBackgroundForParents() {
        var superview = view.superview
        while superview != nil {
            superview?.layer.backgroundColor = UIColor.clear.cgColor
            superview?.layer.shadowColor = UIColor.clear.cgColor
            superview = superview?.superview
        }
    }
}
