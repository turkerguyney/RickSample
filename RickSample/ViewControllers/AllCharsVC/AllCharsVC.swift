//
//  AllCharsVC.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit
import SnapKit

class AllCharsVC:UIViewController {
    
    var coordinator:MainCoordinator?
    
    private var viewModel:AllCharsVM!
    private let searchBar = UISearchBar()
    private let changeBtn = UIButton()
    private let statusSegmentView = UISegmentedControl()
    
    var collectionView:UICollectionView!
    
    var isListMode:Bool = true {
        didSet {
            viewModel.isListMode = isListMode
            
            if isListMode {
                collectionView.collectionViewLayout = getLayout1()
                collectionView.reloadData()
            }else{
                collectionView.collectionViewLayout = getLayout2()
                collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.black
        setViews()
        configureViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    private func setViews(){
        self.view.addSubview(searchBar)
        self.view.addSubview(statusSegmentView)
        self.view.addSubview(changeBtn)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: getLayout1())
        self.view.addSubview(collectionView)
        
        
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
        statusSegmentView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(searchBar.snp.bottom)
        }
        changeBtn.snp.makeConstraints { (make) in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(statusSegmentView.snp.bottom)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(changeBtn.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
        
        
        
    }
    private func configureViews(){
        
        
        changeBtn.setTitle("Change Layout", for: .normal)
        changeBtn.backgroundColor = UIColor.black
        changeBtn.addTarget(self, action: #selector(changeCollectionMode), for: .touchUpInside)
        
        statusSegmentView.insertSegment(withTitle: "All", at: 0, animated: true)
        statusSegmentView.insertSegment(withTitle: FilterStatus.alive.rawValue, at: 1, animated: true)
        statusSegmentView.insertSegment(withTitle: FilterStatus.dead.rawValue, at: 2, animated: true)
        statusSegmentView.insertSegment(withTitle: FilterStatus.unknown.rawValue, at: 3, animated: true)
        
        statusSegmentView.selectedSegmentIndex = 0
        statusSegmentView.addTarget(self, action: #selector(statusSegmentChanged), for: .valueChanged)
        
        viewModel = AllCharsVM(owner: self)
        
        
        collectionView.backgroundColor = UIColor.black
        collectionView.register(AllCharListCell.self, forCellWithReuseIdentifier: AllCharListCell.identifier)
        collectionView.register(AllCharGridCell.self, forCellWithReuseIdentifier: AllCharGridCell.identifier)
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        viewModel.getData(urlStr: "https://rickandmortyapi.com/api/character")
        
        searchBar.delegate = viewModel
        searchBar.showsCancelButton = true
        
    }
    private func getLayout1()->UICollectionViewFlowLayout {
        
        let aLayout = UICollectionViewFlowLayout()
        aLayout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        aLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 50, height: 165)
        aLayout.scrollDirection = .vertical
        
        return aLayout
    }
    private func getLayout2()->UICollectionViewFlowLayout {
        
        let aLayout = UICollectionViewFlowLayout()
        aLayout.sectionInset = UIEdgeInsets(top: 10, left: 15, bottom: 0, right: 15)
        aLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20 , height: 100)
        aLayout.scrollDirection = .vertical
        
        return aLayout
    }
    
}
extension AllCharsVC {
    @objc func changeCollectionMode(){
        isListMode = !isListMode
    }
    @objc func statusSegmentChanged(){
        print()
        switch statusSegmentView.selectedSegmentIndex {
        case 0:
            viewModel.filterbyStatus = .none
        case 1:
            viewModel.filterbyStatus = .alive
        case 2:
            viewModel.filterbyStatus = .dead
        case 3:
            viewModel.filterbyStatus = .unknown
        default:
            viewModel.filterbyStatus = .none
        }
    }
}
