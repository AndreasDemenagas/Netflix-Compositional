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
    
    var bannerShows = [TVShow]()
    var continueWatching = [TVShow]()
    var popular = [TVShow]()
    var topRated = [TVShow]()
    var onTheAir = [TVShow]()
    
    var categories = [
        HomeCategories.topBanner.rawValue,
        HomeCategories.clips.rawValue,
        HomeCategories.continueWatching.rawValue,
        HomeCategories.popular.rawValue,
        HomeCategories.topRated.rawValue,
        HomeCategories.onTheAir.rawValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureCollectionView()
        
        fetchHomeSections()
    }
    
    fileprivate func fetchHomeSections() {
        let group = DispatchGroup()
        
        group.enter()
        getBannerShows {
            group.leave()
        }
        
        group.enter()
        getContinueWatching {
            group.leave()
        }
        
        group.enter()
        getPopular {
            group.leave()
        }
        
        group.enter()
        getTopRated {
            group.leave()
        }
        
        group.enter()
        getOnTheAir {
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func getBannerShows(completion: @escaping () -> () ) {
        Service.shared.fetchBannerShows { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching popular", error)
            case .success(let response):
                let filteredShows = response.results.filter { (show) -> Bool in
                    return show.backdrop_path != nil
                }
                self.bannerShows = filteredShows
                completion()
            }
        }
    }
    
    fileprivate func getContinueWatching(completion: @escaping () -> () ) {
        Service.shared.fetchContinueWatching { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching popular", error)
            case .success(let response):
                self.continueWatching = response.results
                completion()
            }
        }
    }
    
    fileprivate func getPopular(completion: @escaping () -> () ) {
        Service.shared.fetchPopularShows { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching popular", error)
            case .success(let response):
                self.popular = response.results
                completion()
            }
        }
    }
    
    fileprivate func getTopRated(completion: @escaping () -> () ) {
        Service.shared.fetchTopRatedShows { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching popular", error)
            case .success(let response):
                self.topRated = response.results
                completion()
            }
        }
    }
    
    fileprivate func getOnTheAir(completion: @escaping () -> () ) {
        Service.shared.fetchOnTheAirShows { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching popular", error)
            case .success(let response):
                self.onTheAir = response.results
                completion()
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
        collectionView.register(HomeClipsCell.self, forCellWithReuseIdentifier: HomeClipsCell.id)
        collectionView.register(HomePosterCell.self, forCellWithReuseIdentifier: HomePosterCell.id)
    }
    
    @objc fileprivate func handleSearch() {
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let seasonListController = SeasonListController(collectionViewLayout: UICollectionViewFlowLayout())
        seasonListController.modalPresentationStyle = .fullScreen
        present(seasonListController, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeCategoryHeader.id, for: indexPath) as! HomeCategoryHeader
        header.text = categories[indexPath.section]
        return header
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return bannerShows.count
        case 1:
            return continueWatching.count
        case 2:
            return popular.count
        case 3:
            return topRated.count
        case 4:
            return onTheAir.count
        default:
            return onTheAir.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCell.id, for: indexPath) as! HomeBannerCell
            bannerCell.tvShow = bannerShows[indexPath.item]
            bannerCell.playButton.isHidden = true 
            return bannerCell
        }
        
        if indexPath.section == 1 {
            let clipsCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeClipsCell.id, for: indexPath) as! HomeClipsCell
            clipsCell.tvShow = onTheAir[indexPath.item]
            return clipsCell
        }
        
        if indexPath.section == 2 {
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCell.id, for: indexPath) as! HomeBannerCell
            bannerCell.tvShow = continueWatching[indexPath.item]
            bannerCell.needsHiddenUI = true
            return bannerCell
        }
        
        let posterCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePosterCell.id, for: indexPath) as! HomePosterCell
        
        if indexPath.section == 3 {
            posterCell.tvShow = popular[indexPath.item]
        }

        else if indexPath.section == 4 {
            posterCell.tvShow = topRated[indexPath.item]
        }
        
        else if indexPath.section == 5 {
            posterCell.tvShow = onTheAir[indexPath.item]
        }
        
        posterCell.imageView.backgroundColor = .darkGray
        return posterCell
    }

}
