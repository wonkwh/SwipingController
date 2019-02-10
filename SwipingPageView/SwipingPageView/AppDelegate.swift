//
//  AppDelegate.swift
//  SwipingPageView
//
//  Created by wonkwh on 11/02/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let collectionController  = SwipingController(collectionViewLayout: UICollectionViewFlowLayout())
        let navController = UINavigationController(rootViewController: collectionController)
        window?.rootViewController = navController
        return true
    }
}

