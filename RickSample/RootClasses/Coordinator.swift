//
//  Coordinator.swift
//  RickSample
//
//  Created by Turker GUNEY on 11.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit

public protocol Coordinator:AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController:UINavigationController {get set}
    var parentCoordinator:Coordinator? { get set}
    
    func start()

    func addChild(child:Coordinator)
    func removeChild(childClass:AnyObject)
    
}
public extension Coordinator {
    func addChild(child:Coordinator){}
    func removeChild(childClass:AnyObject){}
}
