//
//  BottomSheetViewController+DataSource.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

extension BottomSheetViewController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        Section.allCases.count
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        case .visited:
            return viewModel.dataSourceVisitedCountiesCount
        case .bucketlist:
            return viewModel.dataSourceWishlistCountiesCount
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { return UICollectionViewCell() }
        let cell: CountryCell = collectionView.dequeueReusableCell(for: indexPath)
        switch section {
        case .visited:
            let visitedCountries = viewModel.visitedCountries
            cell.configure(with: visitedCountries[indexPath.item])
        case .bucketlist:
            let notVisitedCountries = viewModel.bucketlistCountries
            cell.configure(with: notVisitedCountries[indexPath.item])
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return headerView(for: indexPath, in: collectionView)
        case UICollectionView.elementKindSectionFooter:
            return footerView(for: indexPath, in: collectionView)
        default:
            return UICollectionReusableView()
        }
    }

    private func headerView(for indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionReusableView {
        guard let section = Section(rawValue: indexPath.section) else { return UICollectionReusableView() }
        let header: HeaderView = collectionView.dequeueHeader(for: indexPath)
        switch section {
        case .visited:
            header.title = "I’ve been to"
        case .bucketlist:
            header.title = "My bucket list"
        }
        return header
    }

    private func footerView(for indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionReusableView {
        let footer: FooterView = collectionView.dequeueFooter(for: indexPath)
        footer.isLast = (indexPath.section == collectionView.numberOfSections - 1)
        footer.footerTopSection.delegate = self
        footer.footerTopSection.tag = indexPath.section
        switch indexPath.section {
        case 0:
            footer.remainingCount = viewModel.seeMoreVisitedCount
            footer.showSeparatorOnly = viewModel.seeMoreVisitedListIsHidden
        case 1:
            footer.remainingCount = viewModel.seeMoreWishlistCount
            footer.showSeparatorOnly = viewModel.seeMoreBucketlistIsHidden
        default:
            break
        }
        return footer
    }
}
