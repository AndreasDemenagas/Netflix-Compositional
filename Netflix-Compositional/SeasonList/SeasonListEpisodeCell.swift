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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemYellow
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
