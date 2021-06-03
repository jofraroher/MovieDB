//
//  MediaListContracts.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation

// MARK: View
protocol MediaListViewProtocol: class {
    func update(presentation: [Media])
}

// MARK: Interactor


// MARK: Presenter
protocol MediaListPresenterProtocol: class {
    func load()
}


// MARK: - Router
protocol MediaListRouterProtocol: class {
    func navigate(to route: MediaListRoutes)
}

enum MediaListRoutes {
    case showMediaDetail(Media)
}
