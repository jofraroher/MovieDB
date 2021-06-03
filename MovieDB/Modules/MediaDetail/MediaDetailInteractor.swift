//
//  MediaDetailInteractor.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

class MediaDetailInteractor: MediaDetailInteractorProtocol {

    weak var delegate: MediaDetailInteractorDelegate?

    func getMovieDetail(id: Int) {

        let pluginsArray:[PluginType] = [NetworkLoggerPlugin()]
        let provider = MoyaProvider<APIService>(plugins: pluginsArray)

        provider.request(.getMovieDetails(id: id)) { [weak self] response in
            guard let self = self else { return }

            switch response {
            case .success(let value):
                let data = value.data

                do {

                    let dataAux = try JSONSerialization.jsonObject(with: data, options: [])
                    if let json = dataAux as? [String: Any] {

                        guard let results = json["results"] as? [[String: Any]], results.count > 0 else { return }

                        let trailerKey = results[0]["key"] as? String
                        self.delegate?.handleOutput(.movieDetail(trailerKey ?? ""))
                    }

                } catch let error {
                    print(error)
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
