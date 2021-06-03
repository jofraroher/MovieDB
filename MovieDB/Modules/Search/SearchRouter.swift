//
//  SearchRouter.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

final class SearchRouter: SearchRouterProtocol {

    let view: UIViewController

    init(view: UIViewController) {
        self.view = view
    }

    func navigate(to route: SearchRoute) {}
}
