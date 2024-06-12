//
//  StatisticView.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class StatisticView: UIStackView {
    private enum Style {
        enum Constant {
            static let stackViewSpacing: CGFloat = 4.0
            static let width: CGFloat = 163.0
            static let height: CGFloat = 49.0
            static let valueLabelFontSize: CGFloat = 22.0
            static let titleLabelFontSize: CGFloat = 15.0
        }
    }

    private let valueLabel: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(
            ofSize: Style.Constant.valueLabelFontSize,
            weight: .semibold
        )
        return $0
    }(UILabel())

    private let titleLabel: UILabel = {
        $0.textColor = .lightGray
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(
            ofSize: Style.Constant.titleLabelFontSize,
            weight: .regular
        )
        return $0
    }(UILabel())

    var valueText: String? {
        get { valueLabel.text }
        set { valueLabel.text = newValue }
    }

    var titleText: String? {
        get { titleLabel.text }
        set { titleLabel.text = newValue }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        alignment = .center
        spacing = Style.Constant.stackViewSpacing
        for view in [valueLabel, titleLabel] {
            addArrangedSubview(view)
        }
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: Style.Constant.width),
            heightAnchor.constraint(equalToConstant: Style.Constant.height),
        ])
    }
}
