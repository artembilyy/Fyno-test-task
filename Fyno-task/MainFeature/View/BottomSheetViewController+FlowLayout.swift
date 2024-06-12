//
//  BottomSheetViewController+FlowLayout.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

extension BottomSheetViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Style.CollectionViewLayout.itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Style.CollectionViewLayout.headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let isHidden: Bool
        switch section {
        case 0:
            isHidden = viewModel.seeMoreVisitedListIsHidden
        case 1:
            isHidden = viewModel.seeMoreWishlistIsHidden
        default:
            return CGSize.zero
        }
        let height = isHidden ? 0 : Style.CollectionViewLayout.footerHeight
        return CGSize(width: collectionView.frame.width, height: height)
    }
}
