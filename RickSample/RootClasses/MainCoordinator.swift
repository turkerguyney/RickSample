//
//  MainCoordinator.swift
//  RickSample
//
//  Created by Turker GUNEY on 11.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController:UINavigationController
    var parentCoordinator: Coordinator?
    
    init(_ navigationController:UINavigationController) {
      self.navigationController = navigationController
      
    }
    
    func start() {
      let vc = AllCharsVC()
       vc.coordinator = self
      self.navigationController.pushViewController(vc, animated: false)
      
    }
    func popVC(){
        self.navigationController.popViewController(animated: true)
    }
    func pushCharDetail(data:Character){
        let vc = CharDetailVC()
        vc.character = data
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
