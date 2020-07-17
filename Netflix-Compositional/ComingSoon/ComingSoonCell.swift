//
//  ComingSoonCell.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 17/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class ComingSoonCell: UICollectionViewCell {
    
    static var id = String(describing: self)
    
    let backdropImageView = UIImageView()
    
    var show: TVShow? {
        didSet {
            if let urlString = show?.backdrop_path {
                backdropImageView.loadImageFromCacheOrDownload(urlString: "https://image.tmdb.org/t/p/w500/\(urlString)")
            }
            titleLabel.text = show?.name
        }
    }
    
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(backdropImageView)
        backdropImageView.fillSuperView()
        
        addSubview(titleLabel)
        titleLabel.fillSuperView()
        
        backdropImageView.backgroundColor = .systemIndigo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
