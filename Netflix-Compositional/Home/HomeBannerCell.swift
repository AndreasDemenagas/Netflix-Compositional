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
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.boldSystemFont(ofSize: 18))
        lbl.adjustsFontForContentSizeCategory = true
        return lbl
    }()
    
    let playButton = UIImageView()
    
    let blackView = UIView()
    
    var tvShow: TVShow? {
        didSet {
            if let urlString = tvShow?.backdrop_path {
                imageView.loadImageFromCacheOrDownload(urlString: "https://image.tmdb.org/t/p/w500/\(urlString)")
            }
            titleLabel.isHidden = false
            blackView.isHidden = false
            playButton.isHidden = true
            titleLabel.text = tvShow?.name
            imageView.layer.cornerRadius = 0
        }
    }
    
    var needsHiddenUI: Bool? {
        didSet {
            imageView.layer.cornerRadius = 5
            titleLabel.isHidden = true
            blackView.isHidden = true
            playButton.isHidden = false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.layer.masksToBounds = true 
        imageView.fillSuperView()
        
        blackView.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        addSubview(blackView)
        blackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: .zero, height: 40))
        
        addSubview(titleLabel)
        titleLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: .zero, height: 40))
        
        playButton.image = #imageLiteral(resourceName: "icons8-play-64")
        addSubview(playButton)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 34).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
