//
//  SeasonListEpisodeCell.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 22/8/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class SeasonListEpisodeCell: UICollectionViewCell  {
    
    static let id = "SeasonListEpisodeCellID"
    
    var episode: TVEpisode? {
        didSet {
            titleLabel.text = episode?.name
            if let urlString = episode?.stillPath, let voteAvg = episode?.voteAverage {
                photoImageView.loadImageFromCacheOrDownload(urlString: "https://image.tmdb.org/t/p/w500/\(urlString)")
                voteLabel.text = "\(Int(voteAvg))/10"
            }
        }
    }
    
    private let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "anh_backdrop")
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.boldSystemFont(ofSize: 18))
        return label
    }()
    
    private let voteLabel: UILabel = {
        let label = UILabel()
        label.text = "7/10"
        label.textColor = .lightGray
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16))
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        let imageWidth: CGFloat = 130
        
        addSubview(photoImageView)
        photoImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 8, bottom: 0, right: 0), size: .init(width: imageWidth, height: imageWidth/1.77))
        
        let labelsStack = UIStackView(arrangedSubviews: [titleLabel, voteLabel])
        labelsStack.axis = .vertical
        labelsStack.spacing = 8
        labelsStack.alignment = .top
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelsStack)
        labelsStack.anchor(top: photoImageView.topAnchor, leading: photoImageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: .zero, height: photoImageView.frame.height))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
