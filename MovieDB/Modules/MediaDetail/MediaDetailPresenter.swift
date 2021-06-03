//
//  MediaDetailPresenter.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation
import UIKit

class MediaDetailPresenter: MediaDetailPresenterProtocol {

    weak private var view: MediaDetailViewProtocol?
    private let interactor: MediaDetailInteractorProtocol
    private let media: Media

    init(view: MediaDetailViewProtocol, media: Media, interactor: MediaDetailInteractorProtocol) {
        self.view = view
        self.media = media
        self.interactor = interactor

        self.interactor.delegate = self
    }

    func load() {
        view?.update(presentation: media)
    }

    func getMovieDetail(id: Int) {
        interactor.getMovieDetail(id: id)
    }
}

extension MediaDetailPresenter: MediaDetailInteractorDelegate{
    func handleOutput(_ output: MediaDetailInteractorOutput) {
        switch output {
        case .movieDetail(let movieKey):
            view?.showMovieTrailer(trailerKey: movieKey)
        }
    }
}
