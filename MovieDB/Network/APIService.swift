//
//  APIService.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Moya

enum APIService {
    case searchMovies(title: String, type: String?, year: String?)
    case allMoviesRequest
}

extension APIService: TargetType {

    var API_KEY: String {
        return "cc4602d7deb14f92087bebff9b9e03cb"
    }

    var baseURL: URL {
        switch self {
        case .searchMovies:
            return URL(string: "https://api.themoviedb.org/3/search/movie")!
        case .allMoviesRequest:
            return URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc")!
        }
    }

    var path: String {
        return ""
    }

    var method: Method {
        switch self {
        case .searchMovies:
            return .get
        case .allMoviesRequest:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }

    var parameters: [String : Any] {
        switch self {
        case .searchMovies(let title, let type, let year):

            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            parameters["query"] = title

            if let type = type{
                parameters["type"] = type
            }

            if let year = year {
                parameters["primary_release_year"] = year
            }

            return parameters

        case .allMoviesRequest:
            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            return parameters
        }
    }

    var headers: [String : String]? {
        return nil
    }

}
