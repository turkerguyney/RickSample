//
//  DataExt.swift
//  RickSample
//
//  Created by Turker GUNEY on 11.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import Foundation

extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}
