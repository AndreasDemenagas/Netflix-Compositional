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
    
    var tvSeason: TVSeason? {
        didSet {
            fetchSeasonEpisodes()
        }
    }
    
    var seasonEpisodes: [TVEpisode]? {
        didSet {
            print("AAA")
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInset.top = -(UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0)
        collectionView.register(SeasonHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SeasonHeaderView.id)
        collectionView.register(SeasonInfoCell.self, forCellWithReuseIdentifier: SeasonInfoCell.id)
        collectionView.register(SeasonListEpisodeCell.self, forCellWithReuseIdentifier: SeasonListEpisodeCell.id)
    }
    
    func fetchShowSeason(id: Int, completion: @escaping () -> ()) {
        Service.shared.fetchTVSeason(id: id) { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching season", error)
            case .success(let response):
                self.tvSeason = response
                completion()
            }
        }
    }
    
    func fetchSeasonEpisodes() {
        guard let showId = tvSeason?.id else { return }
        Service.shared.fetchTVEpisodes(showId: showId, seasonNumber: 1) { (result) in
            switch result {
            case .failure(let error):
                print("Error fetching season", error)
            case .success(let response):
                self.seasonEpisodes = response.episodes
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let seasonHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SeasonHeaderView.id, for: indexPath) as! SeasonHeaderView
        seasonHeader.season = tvSeason
        seasonHeader.delegate = self
        return seasonHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let headerSize = CGSize.init(width: view.frame.width, height: view.frame.height / 2 + 75)
        return section == 0 ? headerSize : .zero
    }
    
    @objc func didCancelHeader() {
        dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : seasonEpisodes?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: SeasonInfoCell.id, for: indexPath) as! SeasonInfoCell
            infoCell.tvseason = tvSeason
            return infoCell
        }
        
        let episodeCell = collectionView.dequeueReusableCell(withReuseIdentifier: SeasonListEpisodeCell.id, for: indexPath) as! SeasonListEpisodeCell
        episodeCell.episode = seasonEpisodes?[indexPath.item]
        return episodeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            if let text = tvSeason?.lastEpisodeToAir.overview {
                let cellHeight = getInfoCellHeight(for: text)
                return .init(width: view.frame.width, height: cellHeight)
            }
        }
        
        return .init(width: view.frame.width, height: 180)
    }
    
    fileprivate func getInfoCellHeight(for text: String) -> CGFloat {
        let knownCellHeight: CGFloat = 16 + 20 + 12 + 32 + 60 + 3 + 12
        let rect = NSString(string: text).boundingRect(with: CGSize(width: view.frame.width, height: 2000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], context: nil)
        return knownCellHeight + rect.height
    }
    
}

