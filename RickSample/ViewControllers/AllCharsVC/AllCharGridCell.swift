//
//  AllCharGridCell.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit
import SnapKit

class AllCharGridCell:AllCharCell {
    
    static let identifier = "AllCharGridCellID"
    
    override func setViews() {
        super.setViews()
        charImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        hallowLayer.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        likeIndicator.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(2)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalToSuperview()
            make.height.lessThanOrEqualTo(20)
            make.top.equalTo(likeIndicator.snp.bottom)
        }
        statusLabel.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalToSuperview()
            make.height.lessThanOrEqualTo(20)
            make.top.equalTo(nameLabel.snp.bottom)
        }
        speciesLabel.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalToSuperview()
            make.height.lessThanOrEqualTo(20)
            make.top.equalTo(statusLabel.snp.bottom)
        }
    }
    
    
}
