//
//  SeparatorView.swift
//
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class SeparatorView: UIView {
    private enum Style {
        enum Constant {
            static let separatorHeight: CGFloat = 0.5
            static let topPadding: CGFloat = 8.0
            static let leadingPadding: CGFloat = 24.0
            static let trailingPadding: CGFloat = -24.0
            static let bottomPadding: CGFloat = -8.0
        }
    }

    private let separatorView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        configureSeparator()
        setupConstraints()
    }

    private func configureSeparator() {
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .separator
        addSubview(separatorView)
    }

    private func setupConstraints() {
        let constraint = {
            let constraint = separatorView.heightAnchor.constraint(equalToConstant: Style.Constant.separatorHeight)
            constraint.priority = .defaultLow
            return constraint
        }()
        
        NSLayoutConstraint.activate([
            constraint,
            separatorView.topAnchor.constraint(equalTo: topAnchor, constant: Style.Constant.topPadding),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Style.Constant.leadingPadding),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Style.Constant.trailingPadding),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Style.Constant.bottomPadding),
        ])
    }
}
