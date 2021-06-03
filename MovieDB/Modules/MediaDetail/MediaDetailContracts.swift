//
//  MediaDetailContracts.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation

// MARK: View
protocol MediaDetailViewProtocol: class {
    func update(presentation: Media)
    func showMovieTrailer(trailerKey: String)
}

// MARK: Interactor
protocol MediaDetailInteractorProtocol: class {
    var delegate: MediaDetailInteractorDelegate? { get set }
    func getMovieDetail(id: Int)
}

protocol MediaDetailInteractorDelegate: class {
    func handleOutput(_ output: MediaDetailInteractorOutput)
}

enum MediaDetailInteractorOutput {
    case movieDetail(String)
}

// MARK: Presenter
protocol MediaDetailPresenterProtocol: class {
    func load()
    func getMovieDetail(id: Int)
}

enum MediaDetailPresenterOutput {
    case trailerKey(String)
}
