//
//  SearchBuilder.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

final class SearchBuilder {
    static func make(categories: Categories) -> SearchViewController {
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let router = SearchRouter(view: view)
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: view,
                                        interactor: interactor,
                                        router: router,
                                        category: categories)
        view.presenter = presenter
        return view
    }
}
