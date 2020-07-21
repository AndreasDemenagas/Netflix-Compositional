//
//  ComingSoonController.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 17/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class ComingSoonController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewCompositionalLayout.createComingSoonLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private enum Section {
        case main
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, TVShow>?
    
    var allGenres = GenreBank()
    
    var comingSoon = [TVShow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: #imageLiteral(resourceName: "nav-icon"))
        imageView.contentMode = .scaleAspectFill
        navigationItem.titleView = imageView
        
        collectionView.register(ComingSoonCell.self, forCellWithReuseIdentifier: ComingSoonCell.id)
        
        setupDataSource()
        fetchComingSoon()
    }
    
    fileprivate func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, TVShow>(collectionView: collectionView, cellProvider: { (cv, indexPath, tvShow) -> UICollectionViewCell? in
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ComingSoonCell.id, for: indexPath) as! ComingSoonCell
            cell.allGenres = self.allGenres
            cell.show = tvShow
            return cell
        })
    }
    
    fileprivate func fetchComingSoon() {
        Service.shared.fetchComingSoon { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching upcoming", error)
            case .success(let response):
                self.comingSoon = response.results.filter({ (show) -> Bool in
                    show.backdropPath != nil
                })
                self.createSnapshot(with: self.comingSoon)
            }
        }
    }
    
    fileprivate func createSnapshot(with shows: [TVShow]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, TVShow>()
        snapshot.appendSections([.main])
        snapshot.appendItems(shows)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
