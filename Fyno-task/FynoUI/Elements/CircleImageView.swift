//
//  CircleImageView.swift
//
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class CircleImageView: UIView {
    private enum Style {
        enum Constant {
            static let borderWidth = 4.0
        }

        enum Image {
            static let imageView = UIImage(resource: .photo)
        }
    }

    private let imageView = UIImageView(image: Style.Image.imageView)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI: do {
            backgroundColor = .white
            imageView.clipsToBounds = true
            addSubview(imageView)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2

        let borderWidth = Style.Constant.borderWidth
        let imageViewFrame = bounds.insetBy(dx: borderWidth, dy: borderWidth)
        imageView.frame = imageViewFrame
        imageView.layer.cornerRadius = imageViewFrame.height / 2
    }
}
