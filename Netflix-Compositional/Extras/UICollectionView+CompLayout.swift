//
//  UICollectionView+CompLayout.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 6/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    
    static func createHomeControllerLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 16
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.56)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                return section
            }
            
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1.5)))
            item.contentInsets.trailing = 16
            item.contentInsets.bottom = 16
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4), heightDimension: .estimated(400)), subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: HomeController.sectionHeaderElementKindString, alignment: .topLeading)]
            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = .init(top: 12, leading: 16, bottom: 0, trailing: 0)
            
            return section
        }
        
        return layout
    }
    
}
