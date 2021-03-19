//
//  CharDetailVC.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit
import SnapKit

class CharDetailVC:UIViewController {
    
    var coordinator:MainCoordinator?
    
    var character:Character!
    var viewModel:CharDetailVM!
    
    private let imageView = UIImageView()
    private let stackView = UIStackView()
    
    private let nameLabel = DetailLabel()
    private let statusLabel = DetailLabel()
    private let speciesLabel = DetailLabel()
    private let numberOfEpisodesLabel  = DetailLabel()
    private let genderLabel = DetailLabel()
    private let originLabel = DetailLabel()
    private let lastLocationLabel = DetailLabel()
    
    private let lastEpisodeNameLabel = DetailLabel()
    private let lastEpisodeAirDate = DetailLabel()
    
    private let likeBtn = UIButton()
    
    private var isLiked = false {
        didSet{
            if isLiked {
                likeBtn.setImage(UIImage(named: "favor"), for: .normal)
            }else{
                likeBtn.setImage(UIImage(named: "notFavor"), for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        viewModel = CharDetailVM(delegate:self)
        setViews()
        configureViews()
    }
    private func setViews(){
        view.addSubview(imageView)
        view.addSubview(stackView)
        
        imageView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().dividedBy(2.5)
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(imageView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
        view.addSubview(likeBtn)
        likeBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.right.equalTo(-10)
        }
    }
    private func configureViews(){
        view.backgroundColor = UIColor.darkGray
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(statusLabel)
        stackView.addArrangedSubview(speciesLabel)
        stackView.addArrangedSubview(numberOfEpisodesLabel)
        stackView.addArrangedSubview(genderLabel)
        stackView.addArrangedSubview(originLabel)
        stackView.addArrangedSubview(lastLocationLabel)
        stackView.addArrangedSubview(lastEpisodeNameLabel)
        stackView.addArrangedSubview(lastEpisodeAirDate)
        
        nameLabel.text = "Name: \(character.name)"
        statusLabel.text = "Status: \(character.status)"
        speciesLabel.text = "Species: \(character.species ?? "")"
        numberOfEpisodesLabel.text = "Number of Episodes: \(character.episode?.count ?? 0)"
        genderLabel.text = "Gender: \(character.gender ?? "")"
        originLabel.text = "Origin: \(character.origin?.name ?? "")"
        lastLocationLabel.text = "Last seen location: \(character.status)"

        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        if let url = URL(string: character.image ?? ""){
            imageView.kf.setImage(with: url)
        }
        
        
        if let lastEpisode = character.episode?.last {
            viewModel.getEpisodeData(urlStr: lastEpisode)
        }
        
        likeBtn.addTarget(self, action: #selector(likeDidTapped), for: .touchUpInside)
        
        if LikeManager.shared.charCache[character.id] != nil {
            isLiked = true
        }else{
            isLiked = false
        }

    }
    @objc func likeDidTapped(){
        isLiked = !isLiked
        LikeManager.shared.saveChar(char: character, isLiked: isLiked)
    }
}

extension CharDetailVC:CharDetailVMDelegate {
    func episodeDataReady(data: EpisodeModel) {
        DispatchQueue.main.async { [weak self] in
            self?.lastEpisodeNameLabel.text = "Episode Name: \(data.name)"
            self?.lastEpisodeAirDate.text = "Episode Airdate: \(data.air_date)"
        }
    }
}
