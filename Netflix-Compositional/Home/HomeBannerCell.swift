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
    
    var tvShow: TVShow? {
        didSet {
            imageView.backgroundColor = .systemRed
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
