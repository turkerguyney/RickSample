//
//  AllCharCell.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit
import Kingfisher

class AllCharCell:UICollectionViewCell{
    
    var charImageView = UIImageView()
    var likeIndicator = UIImageView()
    var nameLabel = UILabel()
    var statusLabel = UILabel()
    var speciesLabel = UILabel()
    var hallowLayer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setViews(){
        contentView.addSubview(charImageView)
        charImageView.addSubview(hallowLayer)
        contentView.addSubview(likeIndicator)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(speciesLabel)
        
    }
    func configureViews(){
        likeIndicator.contentMode = .scaleAspectFit
        likeIndicator.image = UIImage(named: "notFavor")
        charImageView.contentMode = .scaleAspectFill
        charImageView.clipsToBounds = true
        charImageView.layer.cornerRadius = 5
        
        nameLabel.textColor = UIColor.white
        nameLabel.minimumScaleFactor = 0.5
        nameLabel.adjustsFontSizeToFitWidth = true
        speciesLabel.textColor = UIColor.white
        statusLabel.textColor = UIColor.white
        
        hallowLayer.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
      
    }
    func setData(data:Character){
        nameLabel.text = "Name: \(data.name)"
        speciesLabel.text =  "Species: \(data.species ?? "-")"
        statusLabel.text =  "Status: \(data.status)"
        
        guard let url = URL(string: data.image ?? "") else {
            return
        }
        charImageView.kf.setImage(with: url)
        
        if LikeManager.shared.charCache[data.id] != nil {
            likeIndicator.image = UIImage(named: "favor")
        }else{
            likeIndicator.image = UIImage(named: "notFavor")
        }
    }
    
}
