//
//  MediaDetailBuilder.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation
import UIKit

class MediaDetailBuilder {
    static func make(media: Media) -> MediaDetailViewController {
        let storyBoard = UIStoryboard(name: "MediaDetail", bundle: nil)
        let view: MediaDetailViewController = storyBoard.instantiateViewController(withIdentifier: "MediaDetailViewController") as! MediaDetailViewController
        let interactor = MediaDetailInteractor()
        let presenter = MediaDetailPresenter(view: view, media: media, interactor: interactor)

        view.presenter = presenter

        return view
    }
}
