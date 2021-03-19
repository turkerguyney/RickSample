//
//  LikeManager.swift
//  RickSample
//
//  Created by Turker GUNEY on 13.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import Foundation

class LikeManager {
    
    static let shared = LikeManager()
    
    var charCache = [Int:Character]()
    
    private init(){
        loadChars()
    }
    private func loadChars(){
        if let rawVal = UserDefaults.standard.value(forKey: "Liked") as? Data{
            do {
                charCache =  try JSONDecoder().decode([Int:Character].self, from: rawVal)
            }catch{
                
            }
        }else{
            charCache = [Int:Character]()
        }
    }
    
    
    func saveChar(char:Character,isLiked:Bool){
        
        
        if isLiked {
            charCache[char.id] = char
        }else{
            charCache[char.id] = nil
        }
        do {
            let rawVal = try JSONEncoder().encode(charCache)
            UserDefaults.standard.setValue(rawVal, forKey: "Liked")
        }catch{
            
        }
        
        
        
    }
    
}
