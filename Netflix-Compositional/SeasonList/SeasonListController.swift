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
        collectionView.register(SeasonInfoCell.self, forCellWithReuseIdentifier: SeasonInfoCell.id)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let seasonHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SeasonHeaderView.id, for: indexPath) as! SeasonHeaderView
        seasonHeader.delegate = self
        return seasonHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height / 2 + 75)
    }
    
    @objc func didCancelHeader() {
        dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeasonInfoCell.id, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
    
}

