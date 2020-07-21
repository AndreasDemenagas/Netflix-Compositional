//
//  SeasonListController.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 20/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class SeasonListController: UICollectionViewController, UICollectionViewDelegateFlowLayout, SeasonHeaderDelegate {
    
    var tvShow: TVShow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInset.top = -(UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0)
        collectionView.register(SeasonHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SeasonHeaderView.id)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let seasonHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SeasonHeaderView.id, for: indexPath) as! SeasonHeaderView
        seasonHeader.delegate = self
        return seasonHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height / 2 + 100)
    }
    
    func didCancelHeader() {
        dismiss(animated: true, completion: nil)
    }
    
}

