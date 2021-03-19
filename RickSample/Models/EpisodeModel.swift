//
//  EpisodeModel.swift
//  RickSample
//
//  Created by Turker GUNEY on 12.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import Foundation

struct EpisodeModel:Decodable {
    let id:Int
    let name:String
    let air_date:String
    let episode:String
    let  characters:[String]?
    let url:String?
    let created:String?
}
