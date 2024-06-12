//
//  VerticalDividerView.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class VerticalDividerView: UIView {
    private enum Style {
        enum Constant {
            static let topPadding: CGFloat = 8.0
            static let bottomPadding: CGFloat = -8.0
            static let dividerWidth: CGFloat = 0.5
        }
    }

    private let divider = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDivider()
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

    private func setupDivider() {
        divider.backgroundColor = .separator
        divider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(divider)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Style.Constant.topPadding
            ),
            divider.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Style.Constant.bottomPadding
            ),
            divider.centerXAnchor.constraint(equalTo: centerXAnchor),
            divider.widthAnchor.constraint(equalToConstant: Style.Constant.dividerWidth),
        ])
    }
}
