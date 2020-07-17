//
//  ComingSoonLayout.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 17/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    
    static func createComingSoonLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets.bottom = 16
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(550)), subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        
        return layout
    }
    
}
