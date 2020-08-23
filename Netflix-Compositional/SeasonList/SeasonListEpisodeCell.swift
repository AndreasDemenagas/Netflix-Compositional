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
            if let urlString = episode?.stillPath, let voteAvg = episode?.voteAverage, let name = episode?.name, let epNumber = episode?.episodeNumber {
                titleLabel.text = "\(epNumber). \(name)"
                photoImageView.loadImageFromCacheOrDownload(urlString: "https://image.tmdb.org/t/p/w500/\(urlString)")
                voteLabel.text = "\(Int(voteAvg))/10"
            }
            outlineLabel.text = episode?.overview
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
    
    private let downloadImageView: UIImageView = {
        let iv = UIImageView(image: UIImage.init(systemName: "square.and.arrow.down")?.withRenderingMode(.alwaysTemplate))
        iv.tintColor = .white
        return iv
    }()
    
    private let playImageView: UIImageView = {
        let iv = UIImageView(image: UIImage.init(systemName: "play.circle")?.withRenderingMode(.alwaysTemplate))
        iv.tintColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
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
    
    private let outlineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
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
        
        addSubview(playImageView)
        playImageView.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor).isActive = true
        playImageView.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor).isActive = true
        playImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        playImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        let labelsStack = UIStackView(arrangedSubviews: [titleLabel, voteLabel])
        labelsStack.axis = .vertical
        labelsStack.spacing = 8
        labelsStack.alignment = .top
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(downloadImageView)
        downloadImageView.anchor(top: photoImageView.topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 24, left: 0, bottom: 0, right: 16), size: .init(width: 30, height: 30))
        
        addSubview(labelsStack)
        labelsStack.anchor(top: photoImageView.topAnchor, leading: photoImageView.trailingAnchor, bottom: nil, trailing: downloadImageView.leadingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8), size: .init(width: .zero, height: photoImageView.frame.height))
        
        addSubview(outlineLabel)
        outlineLabel.anchor(top: photoImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 16), size: .init(width: .zero, height: 70))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
