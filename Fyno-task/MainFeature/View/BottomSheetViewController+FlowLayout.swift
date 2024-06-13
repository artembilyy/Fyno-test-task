//
//  BottomSheetViewController+FlowLayout.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

extension BottomSheetViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Style.CollectionViewLayout.itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Style.CollectionViewLayout.headerHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: calculateFooterHeight(
                numberOfSections: collectionView.numberOfSections,
                section: section
            )
        )
    }

    private func calculateFooterHeight(numberOfSections: Int, section: Int) -> CGFloat {
        let height: CGFloat
        let isHidden: Bool

        guard let section = Section(rawValue: section) else { return CGFloat.zero }

        switch section {
        case .visited:
            isHidden = viewModel.seeMoreVisitedListIsHidden
        case .bucketlist:
            isHidden = viewModel.seeMoreBucketlistIsHidden
        }
        if section.rawValue == numberOfSections - 1 {
            height = isHidden ? 0 : 48
        } else {
            height = isHidden ? 16 : Style.CollectionViewLayout.footerHeight
        }
        return height
    }
}
