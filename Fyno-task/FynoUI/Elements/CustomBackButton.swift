//
//  CustomBackButton.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 13.06.2024.
//

import UIKit

final class CustomBackButton: UIView {
    typealias Action = () -> Void
    private var action: Action?

    private let chevronImage = UIImage(resource: .chevronLeftSmall)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        let imageView = UIImageView(image: chevronImage)
        imageView.frame = bounds
        addSubview(imageView)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(handeAction))
        addGestureRecognizer(gesture)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func handeAction() {
        action?()
    }
}

extension CustomBackButton {
    static func create(action: Action?) -> CustomBackButton {
        let view = CustomBackButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        view.action = action
        return view
    }
}
