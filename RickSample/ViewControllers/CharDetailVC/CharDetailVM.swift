//
//  CharDetailVM.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import Foundation

protocol CharDetailVMDelegate: NSObject {
    func episodeDataReady(data:EpisodeModel)
}

class CharDetailVM {
    
    weak var delegate:CharDetailVMDelegate?
    
    convenience init(delegate:CharDetailVMDelegate){
        self.init()
        self.delegate = delegate
    }
    
    func getEpisodeData(urlStr:String){

        guard let url = URL(string: urlStr) else {return}
        
        RestManager().getData(fromURL: url) {[weak self] (data) in
            do{
                guard let data = data else {return}
                let episodeModel = try JSONDecoder().decode(EpisodeModel.self, from: data)
                self?.delegate?.episodeDataReady(data: episodeModel)
            }catch{
                
            }
            
        }
    }
    
    
}
