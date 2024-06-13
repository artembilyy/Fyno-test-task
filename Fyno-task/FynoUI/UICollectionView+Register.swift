//
//  UICollectionView+Register.swift
//  Fyno-task
//
//  Created by Artem Bilyi on 11.06.2024.
//

import UIKit

extension UICollectionViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(_: T.Type, identifier: String? = nil) {
        let identifier = identifier ?? T.identifier
        register(T.self, forCellWithReuseIdentifier: identifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifie: \(T.identifier)")
        }
        return cell
    }

    func registerFooter<T: UICollectionReusableView>(_: T.Type, identifier: String? = nil) {
        let identifier = identifier ?? String(describing: T.self)
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier)
    }

    func registerHeader<T: UICollectionReusableView>(_: T.Type, identifier: String? = nil) {
        let identifier = identifier ?? String(describing: T.self)
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
    }

    func dequeueFooter<T: UICollectionReusableView>(for indexPath: IndexPath, identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue footer with identifier: \(identifier)")
        }
        return footer
    }

    func dequeueHeader<T: UICollectionReusableView>(for indexPath: IndexPath, identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue header with identifier: \(identifier)")
        }
        return header
    }
}
