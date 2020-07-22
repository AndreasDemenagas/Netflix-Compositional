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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        backgroundColor = .systemPink
    }
    
}
