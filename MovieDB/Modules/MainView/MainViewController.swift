//
//  MainViewController.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        let searchVCPopular = SearchBuilder.make(categories: .popular)

        self.setViewControllers([searchVCPopular], animated: false)
        self.selectedIndex = 0

    }

}
