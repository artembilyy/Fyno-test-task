//
//  TopSectionView.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class TopSectionView: UIView {
    private enum Style {
        enum Constant {
            static let mainStackViewTopPadding: CGFloat = 4.0
            static let mainStackViewBottomPadding: CGFloat = -4.0
            static let topStackViewSpacing: CGFloat = 4.0
            static let nameLabelFontSize: CGFloat = 17.0
            static let descriptionLabelFontSize: CGFloat = 13.0
        }

        enum Image {
            static let editView = UIImage(resource: .pencil)
        }

        enum Text {
            static let nameLabel = "John Doe"
            static let descriptionLabel = "Globe-trotter, fearless adventurer, cultural enthusiast, storyteller"
        }
    }

    private let imageView = UIImageView(image: Style.Image.editView)

    private let mainStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .leading
        return $0
    }(UIStackView())

    private let topStackView: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = Style.Constant.topStackViewSpacing
        $0.distribution = .equalSpacing
        $0.alignment = .leading
        return $0
    }(UIStackView())

    private let nameLabel: UILabel = {
        $0.text = Style.Text.nameLabel
        $0.textColor = .black
        $0.font = UIFont.systemFont(
            ofSize: Style.Constant.nameLabelFontSize,
            weight: .semibold
        )
        return $0
    }(UILabel())

    private let descriptionLabel: UILabel = {
        $0.text = Style.Text.descriptionLabel
        $0.textColor = .gray
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(
            ofSize: Style.Constant.descriptionLabelFontSize,
            weight: .regular
        )
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        [nameLabel, imageView].forEach { view in
            topStackView.addArrangedSubview(view)
        }
        for view in [topStackView, descriptionLabel] {
            mainStackView.addArrangedSubview(view)
        }
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Style.Constant.mainStackViewTopPadding
            ),
            mainStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Style.Constant.mainStackViewBottomPadding
            ),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
