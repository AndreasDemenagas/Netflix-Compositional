//
//  SeasonInfoCell.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 22/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class SeasonInfoCell: UICollectionViewCell {
    
    static let id = String(describing: self)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "\"The beginning of the end\""
        label.textColor = .white
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.boldSystemFont(ofSize: 18))
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Agent Phil Coulson of S.H.I.E.L.D. (Strategic Homeland Intervention, Enforcement and Logistics Division) puts together a team of agents to investigate the new, the strange and the unknown around the globe, protecting the ordinary from the extraordinary."
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16))
        return label
    }()
    
    private let checkmarkButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    private let listIconLabel: UILabel = {
        let label = UILabel()
        label.text = "In my list"
        label.textColor = .lightGray
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 14))
        return label
    }()
    
    private let ratingIconLabel: UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.textColor = .lightGray
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 14))
        return label
    }()
    
    private let shareIconLabel: UILabel = {
        let label = UILabel()
        label.text = "Share"
        label.textColor = .lightGray
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 14))
        return label
    }()
    
    private let likeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    private let shareButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    private let separatorLine = UIView()
    
    var tvseason: TVSeason? {
        didSet {
            guard let title = tvseason?.lastEpisodeToAir.name, let overview = tvseason?.lastEpisodeToAir.overview else { return }
            titleLabel.text = "\"\(title)\""
            descriptionLabel.text = overview
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 32, bottom: 0, right: 32), size: .init(width: .zero, height: 20))
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        
        let listStack = UIStackView(arrangedSubviews: [checkmarkButton, listIconLabel])
        listStack.spacing = 12
        listStack.alignment = .center
        listStack.axis = .vertical
        
        let ratingStack = UIStackView(arrangedSubviews: [likeButton, ratingIconLabel])
        ratingStack.spacing = 12
        ratingStack.alignment = .center
        ratingStack.axis = .vertical
        
        let shareStack = UIStackView(arrangedSubviews: [shareButton, shareIconLabel])
        shareStack.spacing = 12
        shareStack.alignment = .center
        shareStack.axis = .vertical
        
        let buttonStack = UIStackView(arrangedSubviews: [listStack, ratingStack, shareStack])
        buttonStack.axis = .horizontal
        buttonStack.alignment = .leading
        buttonStack.distribution = .fillEqually
        
        addSubview(buttonStack)
        buttonStack.anchor(top: descriptionLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: frame.width * 0.65, height: 60))
        
        separatorLine.backgroundColor = .darkGray
        addSubview(separatorLine)
        separatorLine.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, size: .init(width: .zero, height: 3))
    }
    
}
