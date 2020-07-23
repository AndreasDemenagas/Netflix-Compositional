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
    
    private let checkmarkButton: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "checkmark"))
        return iv
    }()
    
    private let likeButton: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "hand.thumbsup"))
        return iv
    }()
    
    private let shareButton: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "square.and.arrow.up"))
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
//        backgroundColor = .systemPink
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 16, left: 32, bottom: 0, right: 32))
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        
        let buttonStack = UIStackView(arrangedSubviews: [checkmarkButton, likeButton, shareButton])
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        
        addSubview(buttonStack)
        buttonStack.anchor(top: descriptionLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 24, left: 0, bottom: 0, right: 0), size: .init(width: 50, height: 20))
    }
    
}
