//
//  HeaderView.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class HeaderView: UICollectionReusableView {
    private enum Style {
        enum Constant {
            static let titleLabelFontSize: CGFloat = 17.0
            static let titleLabelLeadingPadding: CGFloat = 24.0
            static let addButtonTrailingPadding: CGFloat = -24.0
            static let addButtonHeight: CGFloat = 32.0
            static let addButtonWidth: CGFloat = 138.0
        }
    }

    private let titleLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(
            ofSize: Style.Constant.titleLabelFontSize,
            weight: .semibold
        )
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    private let addButton = AddButton()

    var title: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white
        for view in [titleLabel, addButton] {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Style.Constant.titleLabelLeadingPadding
            ),

            addButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            addButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: Style.Constant.addButtonTrailingPadding
            ),
            addButton.heightAnchor.constraint(equalToConstant: Style.Constant.addButtonHeight),
            addButton.widthAnchor.constraint(equalToConstant: Style.Constant.addButtonWidth),
        ])
    }
}
