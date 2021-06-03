//
//  AppRouter.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

final class AppRouter {
    let window: UIWindow

    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }

    func launchMainView(){
        let viewController = MainViewPresenter.make()
        let navigationController = BaseNavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}
