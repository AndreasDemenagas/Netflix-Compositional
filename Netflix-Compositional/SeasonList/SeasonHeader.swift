//
//  SeasonHeader.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 21/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit
import SwiftUI

protocol SeasonHeaderDelegate: AnyObject {
    func didCancelHeader()
}

class SeasonHeaderView: UICollectionReusableView {
    
    static let id = String(describing: self)
    
    weak var delegate: SeasonHeaderDelegate?
    
    private let backButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return btn
    }()
    
    private let backgroundImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "ros_poster"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let mainPosterImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "ros_poster"))
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 5
        iv.layer.masksToBounds = true
        iv.backgroundColor = .red
        return iv
    }()
    
    private let infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.textAlignment = .center
        let font =  UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .regular))
        let attributedText = NSMutableAttributedString(string: "6.23 Agree", attributes: [NSAttributedString.Key.foregroundColor: UIColor.green, NSAttributedString.Key.font: font])
        attributedText.append(.init(string: " • 2020 • 3 seasons", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: font]))
        lbl.attributedText = attributedText
        return lbl
    }()
    
    private let playButton = SeasonHeaderButton(imageName: "play.fill", title: "Watch Now", backgroundColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    @objc fileprivate func handleCancel() {
        delegate?.didCancelHeader()
    }
    
    fileprivate func setupViews() {
        addSubview(backgroundImageView)
        backgroundImageView.fillSuperView()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
        
        addSubview(backButton)
        backButton.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 62, left: 24, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        
        addSubview(mainPosterImageView)
        mainPosterImageView.anchor(top: backButton.topAnchor, leading: nil, bottom: nil, trailing: nil, size: .init(width: 200, height: 300))
        mainPosterImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(infoLabel)
        infoLabel.anchor(top: mainPosterImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 24, left: 32, bottom: 0, right: 32))
        
        addSubview(playButton)
        playButton.anchor(top: infoLabel.bottomAnchor, leading: infoLabel.leadingAnchor, bottom: nil, trailing: infoLabel.trailingAnchor, padding: .init(top: 16, left: 0, bottom: 0, right: 0), size: .init(width: .zero, height: 40))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
