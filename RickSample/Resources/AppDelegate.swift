//
//  AppDelegate.swift
//  RickSample
//
//  Created by Turker GUNEY on 11.01.2021.
//  Copyright © 2021 Turker GUNEY. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        configureForStorybordLess()
        return true
    }
    private func configureForStorybordLess(){
           
           let navController = UINavigationController()
           let rootCoordinator = MainCoordinator(navController)
           rootCoordinator.start()
           
           let tempWindow = UIWindow(frame: UIScreen.main.bounds)
           tempWindow.rootViewController = navController
           tempWindow.makeKeyAndVisible()
           self.window = tempWindow
           
           
       }

}

