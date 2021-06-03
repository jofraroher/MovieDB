//
//  BaseNavigationController.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        UITabBar.appearance().barTintColor =  UIColor(hexString: "#081c24")
        UITabBar.appearance().tintColor = .white
    }

    private func configureNavigationBar() {
        UINavigationBar.appearance().barTintColor = UIColor(hexString: "#081c24")
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
}
