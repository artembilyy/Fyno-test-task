//
//  BottomSheetViewController+DataSource.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

extension BottomSheetViewController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        2
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            viewModel.visitedCountries.count
        case 1:
            viewModel.wishlistCountries.count
        default:
            0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CountryCell = collectionView.dequeueReusableCell(for: indexPath)
        switch indexPath.section {
        case 0:
            let visitedCountries = viewModel.visitedCountries
            cell.configure(with: visitedCountries[indexPath.item])
        case 1:
            let notVisitedCountries = viewModel.wishlistCountries
            cell.configure(with: notVisitedCountries[indexPath.item])
        default:
            return UICollectionViewCell()
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
        let header: HeaderView = collectionView.dequeueHeader(for: indexPath)
        switch indexPath.section {
        case 0:
            header.title = "I’ve been to"
        case 1:
            header.title = "My bucket list"
        default:
            break
        }
        return header
    }

    private func footerView(for indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionReusableView {
        let footer: FooterView = collectionView.dequeueFooter(for: indexPath)
        footer.isLast = (indexPath.section == collectionView.numberOfSections - 1)
        switch indexPath.section {
        case 0:
            footer.remaining = viewModel.seeMoreVisitedCount
        case 1:
            footer.remaining = viewModel.seeMoreWishlistCount
        default:
            break
        }
        return footer
    }
}
