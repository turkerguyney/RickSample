//
//  RestManager.swift
//  RickSample
//
//  Created by Turker GUNEY on 11.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import Foundation

class RestManager {
    
    func getData(fromURL url:URL,completion:@escaping(_ data:Data?)->Void){
        
        DispatchQueue.global(qos: .userInitiated).async{
            let sessionConfiguration = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfiguration)
            
            let task = session.dataTask(with: url,completionHandler: {
                (data,response,error) in
                guard let data = data else {completion(nil); return }
                completion(data)
            })
            task.resume()
        }
        
    }
}
