//
//  AllCharListCell.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit
import SnapKit

class AllCharListCell:AllCharCell {
    
    static let identifier = "AllCharListCellID"
    
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
            make.right.equalTo(-10)
            make.top.equalTo(10)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.lessThanOrEqualTo(likeIndicator.snp.right)
            make.height.lessThanOrEqualTo(50)
            make.top.equalTo(20)
        }
        statusLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalToSuperview()
            make.height.lessThanOrEqualTo(50)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        speciesLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalToSuperview()
            make.height.lessThanOrEqualTo(50)
            make.top.equalTo(statusLabel.snp.bottom).offset(10)
        }
    }    
    
}
