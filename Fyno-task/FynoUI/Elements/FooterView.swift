//
//  FooterView.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class FooterView: UICollectionReusableView {
    private let separatorView = SeparatorView()
    let footerTopSection = FooterTopSection()
    private let stackView = UIStackView(axis: .vertical, spacing: 1, distribution: .equalSpacing)

    var isLast = false {
        didSet {
            separatorView.isHidden = isLast
        }
    }

    var showSeparatorOnly = false {
        didSet {
            footerTopSection.isHidden = showSeparatorOnly
        }
    }

    var remainingCount = 0 {
        didSet {
            footerTopSection.remainingCount = remainingCount
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(footerTopSection)
        stackView.addArrangedSubview(separatorView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

protocol FooterViewInteraction: AnyObject {
    func pressed(tag: Int)
}

final class FooterTopSection: UIView {
    private enum Style {
        enum Constant {
            static let chevronImageViewTopPadding: CGFloat = 12
            static let chevronImageViewLeadingPadding: CGFloat = 24
            static let chevronImageViewBottomPadding: CGFloat = -12
            static let chevronImageViewWidth: CGFloat = 24
            static let titleLabelLeadingPadding: CGFloat = 8
            static let titleLabelTrailingPadding: CGFloat = -24
        }

        static func makeRemainingText(isExpanded: Bool, remainingCount: Int) -> String {
            let action = isExpanded ? "Hide" : "See"
            return "\(action) \(remainingCount) more"
        }

        enum Image {
            static let chevronDown = UIImage(resource: .chevronDownSmall)
        }
    }

    private let titleLabel = UILabel()
    private let chevronImageView = UIImageView(image: Style.Image.chevronDown)

    weak var delegate: FooterViewInteraction?

    private var isExpanded = false {
        didSet {
            updateChevronRotation()
            titleLabel.text = Style.makeRemainingText(isExpanded: isExpanded, remainingCount: remainingCount)
        }
    }

    var remainingCount = 0 {
        didSet {
            titleLabel.text = Style.makeRemainingText(isExpanded: isExpanded, remainingCount: remainingCount)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .gray
        addSubview(chevronImageView)
        addSubview(titleLabel)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleExpansion))
        addGestureRecognizer(tapGesture)
    }

    @objc
    private func toggleExpansion() {
        isExpanded.toggle()
        delegate?.pressed(tag: tag)
    }

    private func updateChevronRotation() {
        let angle: CGFloat = isExpanded ? .pi : 0
        UIView.animate(withDuration: 0.3) {
            self.chevronImageView.transform = CGAffineTransform(rotationAngle: angle)
        }
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            chevronImageView.topAnchor.constraint(equalTo: topAnchor, constant: Style.Constant.chevronImageViewTopPadding),
            chevronImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Style.Constant.chevronImageViewLeadingPadding),
            chevronImageView.widthAnchor.constraint(equalToConstant: Style.Constant.chevronImageViewWidth),
            chevronImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Style.Constant.chevronImageViewBottomPadding
            ),

            titleLabel.centerYAnchor.constraint(equalTo: chevronImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: chevronImageView.trailingAnchor, constant: Style.Constant.titleLabelLeadingPadding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Style.Constant.titleLabelTrailingPadding),
        ])
    }
}
