//
//  SeasonHeaderButton.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 21/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class SeasonHeaderButton: UIView {
    
    let imageView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.boldSystemFont(ofSize: 18))
        return label
    }()
    
    init(imageName: String, title: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 5
        
        self.imageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        self.imageView.tintColor = .black
        self.titleLabel.text = title
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        
        addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
