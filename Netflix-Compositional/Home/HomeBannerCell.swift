//
//  BannerCell.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 6/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class HomeBannerCell: UICollectionViewCell {
    
    static let id = "HomeBannerCellIDID"
    
    let imageView = UIImageView()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Star Wars: The Clone Wars"
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    let blackView = UIView()
    
    var tvShow: TVShow? {
        didSet {
            if let urlString = tvShow?.backdrop_path {
                imageView.loadImageFromCacheOrDownload(urlString: "https://image.tmdb.org/t/p/w500/\(urlString)")
            }
            titleLabel.text = tvShow?.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperView()
        
        blackView.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        addSubview(blackView)
        blackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: .zero, height: 40))
        
        addSubview(titleLabel)
        titleLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: .zero, height: 40))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
