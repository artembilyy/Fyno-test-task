//
//  StatisticsSectionView.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class StatisticsSectionView: UIStackView {
    private enum Style {
        enum Constant {
            static let stackViewSpacing: CGFloat = 8.0
        }

        enum Text {
            static let countriesValue = "0"
            static let countriesTitle = "countries"
            static let worldValue = "0%"
            static let worldTitle = "world"
        }
    }
    
    private let countriesView = StatisticView()
    private let worldView = StatisticView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var countriesValueText = Style.Text.countriesValue {
        didSet {
            countriesView.valueText = countriesValueText
        }
    }
    
    var worldValueText = Style.Text.worldValue {
        didSet {
            worldView.valueText = worldValueText
        }
    }

    private func setupUI() {
        let divider = VerticalDividerView()

        countriesView.valueText = Style.Text.countriesValue
        countriesView.titleText = Style.Text.countriesTitle

        worldView.valueText = Style.Text.worldValue
        worldView.titleText = Style.Text.worldTitle

        axis = .horizontal
        distribution = .equalSpacing
        spacing = Style.Constant.stackViewSpacing

        for view in [countriesView, divider, worldView] {
            addArrangedSubview(view)
        }
    }
}
