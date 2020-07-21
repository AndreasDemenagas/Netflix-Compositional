//
//  HomePosterCell.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 6/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class HomePosterCell: UICollectionViewCell {
    
    static let id = "HomeBannerCellID"
    
    let imageView = UIImageView()
    
    var tvShow: TVShow? {
        didSet {
            if let urlString = tvShow?.posterPath {
                imageView.loadImageFromCacheOrDownload(urlString: "https://image.tmdb.org/t/p/w500/\(urlString)")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
