//
//  AddButton.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class AddButton: UIControl {
    private enum Style {
        enum Constant {
            static let imageViewLeadingPadding: CGFloat = 4.0
            static let nameLabelTrailingPadding: CGFloat = -12.0
            static let nameLabelFontSize: CGFloat = 15.0
        }

        enum Text {
            static let nameLabel = "Add country"
        }

        enum Image {
            static let plus = UIImage(resource: .plus)
        }

        enum Color {
            static let nameLabelColor = UIColor.systemIndigo
            static let backgroundViewColor = UIColor(
                red: 242 / 255, green: 242 / 255, blue: 242 / 247, alpha: 1
            )
        }
    }

    private let imageView = UIImageView(image: Style.Image.plus)

    private let nameLabel = UILabel()

    private let backgroundView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundView)
        backgroundView.backgroundColor = Style.Color.backgroundViewColor

        for view in [imageView, nameLabel] {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }

        nameLabel.text = Style.Text.nameLabel
        nameLabel.textColor = Style.Color.nameLabelColor
        nameLabel.font = UIFont.systemFont(
            ofSize: Style.Constant.nameLabelFontSize,
            weight: .semibold
        )
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.frame = bounds
        backgroundView.layer.cornerRadius = frame.height / 2
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Style.Constant.imageViewLeadingPadding
            ),
            nameLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Style.Constant.nameLabelTrailingPadding
            ),
        ])
    }
}
