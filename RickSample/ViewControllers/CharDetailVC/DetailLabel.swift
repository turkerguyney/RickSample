//
//  DetailLabel.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit

class DetailLabel:UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = UIColor.white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
