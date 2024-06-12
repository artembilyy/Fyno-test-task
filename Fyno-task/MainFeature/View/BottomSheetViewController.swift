//
//  BottomSheetViewController.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

final class BottomSheetViewController: UIViewController {
    
    enum Style {
        enum Constant {
            static let backgroundViewCornerRadius: CGFloat = 16
            static let backgroundViewTopPadding: CGFloat = 12
            static let topSectionViewTopPadding: CGFloat = 12
            static let topSectionViewTrailingPadding: CGFloat = -24
            static let imageViewLeadingPadding: CGFloat = 19
            static let imageViewWidth: CGFloat = 80
            static let statisticsSectionViewTopPadding: CGFloat = 21
            static let separatorViewTopPadding: CGFloat = 5
        }
        
        enum CollectionViewLayout {
            static let itemHeight: CGFloat = 48
            static let headerHeight: CGFloat = 48
            static let footerHeight: CGFloat = 65
        }
    }
    
    private let imageView = CircleImageView()
    private let topSectionView = TopSectionView()
    private let statisticsSectionView = StatisticsSectionView()
    private let separatorView = SeparatorView()
    
    var viewModel: MainFeatureViewModel!
    
    init(viewModel: MainFeatureViewModel!) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let backgroundView: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = Style.Constant.backgroundViewCornerRadius
        return $0
    }(UIView())
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCell(CountryCell.self)
        collectionView.registerFooter(FooterView.self)
        collectionView.registerHeader(HeaderView.self)
        collectionView.backgroundColor = .white
        return collectionView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI: do {
            let subviews = [backgroundView, imageView, topSectionView, statisticsSectionView, collectionView, separatorView]
            subviews.forEach { view in
                view.translatesAutoresizingMaskIntoConstraints = false
                self.view.addSubview(view)
            }
        }
        
        setupLayout()
        updateUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        removeBackgroundForParents()
    }
    
    private func updateUI() {
        statisticsSectionView.countriesValueText = String(viewModel.visitedCountries.count)
        statisticsSectionView.worldValueText = String(viewModel.percentageOfWorldDiscovery) + " %"
    }
    
    private func setupLayout() {
        
        let backgroundViewConstraints = [
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: Style.Constant.backgroundViewTopPadding),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        let topSectionViewConstraints = [
            topSectionView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: Style.Constant.topSectionViewTopPadding),
            topSectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Style.Constant.topSectionViewTrailingPadding),
            topSectionView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Style.Constant.imageViewLeadingPadding)
        ]

        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Style.Constant.imageViewLeadingPadding),
            imageView.widthAnchor.constraint(equalToConstant: Style.Constant.imageViewWidth),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ]

        let statisticsSectionViewConstraints = [
            statisticsSectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statisticsSectionView.topAnchor.constraint(equalTo: topSectionView.bottomAnchor, constant: Style.Constant.statisticsSectionViewTopPadding)
        ]

        let separatorViewConstraints = [
            separatorView.topAnchor.constraint(equalTo: statisticsSectionView.bottomAnchor, constant: Style.Constant.separatorViewTopPadding),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]

        let collectionViewConstraints = [
            collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        NSLayoutConstraint.activate(
            backgroundViewConstraints
            + topSectionViewConstraints
            + imageViewConstraints
            + statisticsSectionViewConstraints
            + separatorViewConstraints
            + collectionViewConstraints
        )
    }
}
