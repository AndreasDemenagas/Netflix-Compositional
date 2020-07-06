//
//  HomeController.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 6/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewCompositionalLayout.createHomeControllerLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static let sectionHeaderElementKindString = "categoryHeaderId"
    
    var popular = [PopularShow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureCollectionView()
        
        fetchTVShows()
    }
    
    fileprivate func fetchTVShows() {
        Service.shared.fetchPopularShows { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching popular shows", error)
            case .success(let response):
                self.popular = response.results
                self.collectionView.reloadData()
            }
        }
    }
    
    fileprivate func configureNavigationBar() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "nav-icon"))
        imageView.contentMode = .scaleAspectFill
        navigationItem.titleView = imageView
        
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(handleSearch))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(handleSearch))
    }
    
    fileprivate func configureCollectionView() {
        collectionView.contentInset.top = 0
        collectionView.horizontalScrollIndicatorInsets.top = 16
        collectionView.register(HomeCategoryHeader.self, forSupplementaryViewOfKind: HomeController.sectionHeaderElementKindString, withReuseIdentifier: HomeCategoryHeader.id)
        collectionView.register(HomeBannerCell.self, forCellWithReuseIdentifier: HomeBannerCell.id)
        collectionView.register(HomePosterCell.self, forCellWithReuseIdentifier: HomePosterCell.id)
    }
    
    @objc fileprivate func handleSearch() {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeCategoryHeader.id, for: indexPath) as! HomeCategoryHeader
        header.text = "Popular Shows"
        return header
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? 2 : popular.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCell.id, for: indexPath) as! HomeBannerCell
            bannerCell.imageView.backgroundColor = .systemRed
            return bannerCell
        }
        
        let posterCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePosterCell.id, for: indexPath) as! HomePosterCell
        posterCell.tvShow = popular[indexPath.item]
        return posterCell
    }
    
}
