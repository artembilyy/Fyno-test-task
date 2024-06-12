//
//  FooterView.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class FooterView: UICollectionReusableView {
    private enum Style {
        enum Constant {
            static let chevronImageViewTopPadding: CGFloat = 12
            static let chevronImageViewLeadingPadding: CGFloat = 24
            static let chevronImageViewWidth: CGFloat = 24
            static let titleLabelLeadingPadding: CGFloat = 8
            static let titleLabelTrailingPadding: CGFloat = -24
            static let separatorViewTopPadding: CGFloat = 12
        }

        static func makeRemainingText(_ remaining: Int) -> String {
            "See \(remaining) more"
        }

        enum Image {
            static let chevronDown = UIImage(resource: .chevronDownSmall)
        }
    }
                
    private let separatorView = SeparatorView()
    private let titleLabel = UILabel()
    private let chevronImageView = UIImageView(image: UIImage(resource: .chevronDownSmall))
        
    
    var isLast = false {
        didSet {
            separatorView.isHidden = isLast
        }
    }
    
    var remaining = 0 {
        didSet {
            titleLabel.text = Style.makeRemainingText(remaining)
            titleLabel.textColor = .lightGray
        }
    }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            setupConstraints()
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupView() {
            titleLabel.textAlignment = .left
            titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
            chevronImageView.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(chevronImageView)
            addSubview(titleLabel)
            addSubview(separatorView)
        }
        
        func setupConstraints() {
            NSLayoutConstraint.activate([
                chevronImageView.topAnchor.constraint(
                    equalTo: topAnchor,
                    constant: Style.Constant.chevronImageViewTopPadding),
                chevronImageView.leadingAnchor.constraint(
                    equalTo: leadingAnchor,
                    constant: Style.Constant.chevronImageViewLeadingPadding),
                chevronImageView.widthAnchor.constraint(
                    equalToConstant: Style.Constant.chevronImageViewWidth),
                chevronImageView.heightAnchor.constraint(equalTo: chevronImageView.widthAnchor),
                
                titleLabel.centerYAnchor.constraint(equalTo: chevronImageView.centerYAnchor),
                titleLabel.leadingAnchor.constraint(
                    equalTo: chevronImageView.trailingAnchor,
                    constant: Style.Constant.titleLabelLeadingPadding),
                titleLabel.trailingAnchor.constraint(
                    equalTo: trailingAnchor,
                    constant: Style.Constant.titleLabelTrailingPadding),
                
                separatorView.topAnchor.constraint(
                    equalTo: chevronImageView.bottomAnchor,
                    constant: Style.Constant.separatorViewTopPadding),
                separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
                separatorView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }
        
    }
