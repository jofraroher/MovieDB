//
//  MediaListRouter.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation
import UIKit

final class MediaListRouter: MediaListRouterProtocol {
    func navigate(to route: MediaListRoutes) {
        switch route {
        case .showMediaDetail( _):
//            let mediaDetailView = MediaDetailBuilder.make(media: media)
//            view.show(mediaDetailView, sender: nil)
            break
        }
    }


    let view: UIViewController

    init(view: UIViewController) {
        self.view = view
    }
}
