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
            plotLabel.text = show?.overview
        }
    }
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Released Feb 2nd 2020"
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 19, weight: .heavy))
        lbl.adjustsFontForContentSizeCategory = true
        return lbl
    }()
    
    let releasedLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.text = "Released Feb 2nd 2020"
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 15, weight: .regular))
        lbl.adjustsFontForContentSizeCategory = true
        return lbl
    }()
    
    let plotLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 15, weight: .regular))
        lbl.adjustsFontForContentSizeCategory = true
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(backdropImageView)
        backdropImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        let height = frame.width * 0.56
        backdropImageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        addSubview(releasedLabel)
        releasedLabel.anchor(top: backdropImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 16, bottom: 0, right: 16))

        addSubview(titleLabel)
        titleLabel.anchor(top: releasedLabel.bottomAnchor, leading: releasedLabel.leadingAnchor, bottom: nil, trailing: releasedLabel.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))

        addSubview(plotLabel)
        plotLabel.anchor(top: titleLabel.bottomAnchor, leading: releasedLabel.leadingAnchor, bottom: nil, trailing: releasedLabel.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        
        backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
