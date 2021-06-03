//
//  APIService.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Moya

enum APIService {
    case searchMovies(title: String)
    case allMoviesRequest
    case allTopRated
    case allUpcoming
    case getMovieDetails(id: Int)
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
        case .allTopRated:
            return URL(string: "https://api.themoviedb.org/3/movie/top_rated")!
        case .allUpcoming:
            return URL(string: "https://api.themoviedb.org/3/movie/upcoming")!
        case .getMovieDetails(let id):
            return URL(string: "http://api.themoviedb.org/3/movie/\(id)/videos")!
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
        case .allTopRated:
            return .get
        case .allUpcoming:
            return .get
        case .getMovieDetails:
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
        case .searchMovies(let title):

            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            parameters["query"] = title

            return parameters

        case .allMoviesRequest:
            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            return parameters

        case .allTopRated:
            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            return parameters
            
        case .allUpcoming:
            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            return parameters

        case .getMovieDetails:
            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            return parameters
        }
    }

    var headers: [String : String]? {
        return nil
    }

}
