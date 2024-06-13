//
//  BottomSheetViewController+FooterViewInteraction.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 13.06.2024.
//

import Foundation

extension BottomSheetViewController: FooterViewInteraction {
    func pressed(tag: Int) {
        switch tag {
        case 0:
            viewModel.visitedDropDownToogle()
            let extraIndexPaths = (3 ..< viewModel.visitedCountries.count).map { IndexPath(item: $0, section: tag) }
            performBatchUpdate(isActive: viewModel.visitedSeeMoreState, indexPaths: extraIndexPaths)
        case 1:
            viewModel.bucketListDropDownToogle()
            let extraIndexPaths = (3 ..< viewModel.bucketlistCountries.count).map { IndexPath(item: $0, section: tag) }
            performBatchUpdate(isActive: viewModel.bucketlistSeeMoreState, indexPaths: extraIndexPaths)
        default: return
        }
    }

    private func performBatchUpdate(isActive: MainFeatureViewModel.DropDownState, indexPaths: [IndexPath]) {
        let updateBlock = {
            if isActive == .expanded {
                self.collectionView.insertItems(at: indexPaths)
            } else {
                self.collectionView.deleteItems(at: indexPaths)
            }
        }
        collectionView.performBatchUpdates(updateBlock)
    }
}
