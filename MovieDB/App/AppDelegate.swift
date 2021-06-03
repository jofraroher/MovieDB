//
//  AppDelegate.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        app.router.launchMainView()
        
        return true
    }
}

