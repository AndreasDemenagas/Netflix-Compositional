//
//  ComingSoonController.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 17/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class ComingSoonController: UITableViewController {
    
    private enum Section {
        case main
    }
    
    private var dataSource: UITableViewDiffableDataSource<Section, TVShow>?
    
    var allGenres = GenreBank()
    
    var comingSoon = [TVShow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: #imageLiteral(resourceName: "nav-icon"))
        imageView.contentMode = .scaleAspectFill
        navigationItem.titleView = imageView

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.register(ComingSoonCell.self, forCellReuseIdentifier: ComingSoonCell.id)
        
        setupDataSource()
        fetchComingSoon()
    }
    
    fileprivate func setupDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, TVShow>(tableView: tableView, cellProvider: { (tableVew, indexPath, tvShow) -> UITableViewCell? in
            let cell = self.tableView.dequeueReusableCell(withIdentifier: ComingSoonCell.id, for: indexPath) as! ComingSoonCell
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let showPlot = dataSource?.itemIdentifier(for: indexPath)?.overview else {
            return 500
        }
        let rect = NSString(string: showPlot).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)], context: nil)
        let imageViewHeight = view.frame.width * 0.56
        let cellHeight = imageViewHeight + 40 + 20 + 20 + rect.height + 20
        return cellHeight
    }
    
    fileprivate func createSnapshot(with shows: [TVShow]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, TVShow>()
        snapshot.appendSections([.main])
        snapshot.appendItems(shows)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
