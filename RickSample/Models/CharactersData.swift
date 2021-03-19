//
//  SessionModel.swift
//  RickSample
//
//  Created by Turker GUNEY on 11.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import Foundation

struct CharactersData:Codable {
    let info:CharactersDataInfo
    let results:[Character]
}
struct CharactersDataInfo:Codable {
    let count:Int
    let pages:Int
    let next:String?
    let prev:String?
}


struct Character:Codable,CustomStringConvertible {
    
    let id:Int
    let name:String
    let status:String
    let species:String?
    let type:String?
    let gender:String?
    let origin:Origin?
    let location:CharacterLocation?
    let image:String?
    let episode:[String]?
    let url:String?
    let created:String?
    
    var description: String {
       let desc = """
        id : \(id)
        name : \(name)
        species : \(species ?? "")
        type : \(type ?? "undefined")
        gender: \(gender ?? "")
        origin : \(origin?.name ?? "")
        """
        return desc
    }

}
struct Origin:Codable {
    let name:String
    let url:String
}
struct CharacterLocation:Codable {
    let name:String
    let url:String
}

