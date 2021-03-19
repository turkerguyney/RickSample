//
//  AllCharsVM.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit

class AllCharsVM:NSObject {
    
    private var charData:CharactersData? {
        didSet {
            guard let results = charData?.results else {return}
            characters.append(contentsOf: results)
        }
    }
    private var characters = [Character]() {
        didSet {
            filterIt()
        }
    }
    private var filteredCharacters = [Character]() {
        didSet {
            DispatchQueue.main.async {[weak self] in
                self?.owner?.collectionView.reloadData()
            }
        }
    }
    
    
    private weak var owner:AllCharsVC?
    var filterbyStatus:FilterStatus = .none {
        didSet {
            filterIt()
        }
    }
    var filterbyName = "" {
        didSet {
            filterIt()
        }
    }
    
    var isListMode:Bool = true
    
    func filterIt(){
        
        if filterbyName.isEmpty && filterbyStatus == .none{
            filteredCharacters = characters
        }else if filterbyName.isEmpty && filterbyStatus != .none {
            filteredCharacters = characters.filter({ (char) -> Bool in
                char.status == filterbyStatus.rawValue
            })
        }else if !filterbyName.isEmpty && filterbyStatus == .none {
            filteredCharacters = characters.filter({ (char) -> Bool in
                char.name.lowercased().contains(filterbyName.lowercased())
            })
        }else{
            filteredCharacters = characters.filter({ (char) -> Bool in
                char.status == filterbyStatus.rawValue && char.name.lowercased().contains(filterbyName.lowercased())
            })
        }
        
        
    }
    
    convenience init(owner:AllCharsVC){
        self.init()
        self.owner = owner
        
    }
    func getData(urlStr:String){
        
        guard let url = URL(string: urlStr) else {return}
        
        RestManager().getData(fromURL: url) {[weak self] (data) in
            do{
                guard let data = data else {return}
                self?.charData = try JSONDecoder().decode(CharactersData.self, from: data)
            }catch{
                
            }
            
        }
    }
}
extension AllCharsVM:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (filteredCharacters.count - 3) == indexPath.row {
            getData(urlStr: charData?.info.next ?? "")
        }
       
        let cellData = filteredCharacters[indexPath.row]
        var cell:AllCharCell!
        if isListMode {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllCharListCell.identifier, for: indexPath) as? AllCharCell
           
        }else{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllCharGridCell.identifier, for: indexPath) as? AllCharCell
        }
        cell.setData(data:cellData)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellData = filteredCharacters[indexPath.row]
        owner?.coordinator?.pushCharDetail(data: cellData)
    }
}
extension AllCharsVM:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterbyName = searchText
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

enum FilterStatus:String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    case none = "none"
}
