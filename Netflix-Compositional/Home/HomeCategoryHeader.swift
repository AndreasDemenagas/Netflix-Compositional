//
//  HomeCategoryHeader.swift
//  Netflix-Compositional
//
//  Created by Andrew Demenagas on 6/7/20.
//  Copyright © 2020 Andrew Demenagas. All rights reserved.
//

import UIKit

class HomeCategoryHeader: UICollectionReusableView {
    
    static let id = "HomeCategoryHeader"
    
    let label = UILabel()
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        
        addSubview(label)
        label.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
