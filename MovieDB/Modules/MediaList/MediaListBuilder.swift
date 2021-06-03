//
//  MediaListBuilder.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

class MediaListBuilder {
    static func make(media: [Media]) -> MediaListViewController {
        let storyBoard = UIStoryboard(name: "MediaList", bundle: nil)
        let view: MediaListViewController = storyBoard.instantiateViewController(withIdentifier: "MediaListViewController") as! MediaListViewController
        let router = MediaListRouter(view: view)
        let presenter = MediaListPresenter(view: view, mediaArray: media, router: router)
        view.presenter = presenter

        return view
    }
}
