//
//  MainViewPresenter.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

final class MainViewPresenter {
    static func make() -> UIViewController {
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        return viewController
    }
}
