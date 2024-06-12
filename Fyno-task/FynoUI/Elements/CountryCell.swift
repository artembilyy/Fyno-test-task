//
//  CountryCell.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class CountryCell: UICollectionViewCell {

    private enum Style {
        enum Constant {
            static let flagLabelLeadingPadding: CGFloat = 24.0
            static let nameLabelLeadingPadding: CGFloat = 8.0
            static let flagLabelFontSize: CGFloat = 20.0
            static let nameLabelFontSize: CGFloat = 17.0
        }
    }

    private let flagLabel: UILabel = {
        $0.font = UIFont.systemFont(
            ofSize: Style.Constant.flagLabelFontSize,
            weight: .regular
        )
        return $0
    }(UILabel())

    private let nameLabel: UILabel = {
        $0.textColor = .black
        $0.font = UIFont.systemFont(
            ofSize: Style.Constant.nameLabelFontSize,
            weight: .regular
        )
        return $0
    }(UILabel())

    override init(frame: CGRect) {
        super.init(frame: frame)
        for view in [flagLabel, nameLabel] {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }

    func configure(with country: Country) {
        nameLabel.text = country.title
        flagLabel.text = country.flag
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            flagLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            flagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Style.Constant.flagLabelLeadingPadding),

            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: flagLabel.trailingAnchor, constant: Style.Constant.nameLabelLeadingPadding),
        ])
    }
}
