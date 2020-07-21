//
//  HomeClipsCell.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 20/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class HomeClipsCell: UICollectionViewCell {
    
    static let id = "HomeClipsCellIID"
    
    let imageView = UIImageView()
    
    var tvShow: TVShow? {
        didSet {
            if let urlString = tvShow?.backdrop_path {
                imageView.loadImageFromCacheOrDownload(urlString: "https://image.tmdb.org/t/p/w500/\(urlString)")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = frame.width / 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.systemYellow.cgColor
        imageView.layer.borderWidth = 2
        
        addSubview(imageView)
        imageView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

