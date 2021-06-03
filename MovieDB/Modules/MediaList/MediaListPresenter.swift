//
//  MediaListPresenter.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

class MediaListPresenter {

    weak private var view: MediaListViewProtocol?
    private let mediaArray: [Media]
    private let router: MediaListRouterProtocol


    init(view: MediaListViewProtocol, mediaArray: [Media],
    router: MediaListRouterProtocol) {
        self.view = view
        self.mediaArray = mediaArray
        self.router = router
    }

    func showMediaDetail(media: Media) {
        router.navigate(to: .showMediaDetail(media))
    }
}

extension MediaListPresenter: MediaListPresenterProtocol {
    func load() {
        view?.update(presentation: mediaArray)
    }
}
