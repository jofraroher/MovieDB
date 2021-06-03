//
//  SearchContracts.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - View

protocol SearchViewProtocol: class {
    func handlePresenterOutput(_ output: SearchPresenterOutput)
}

enum Categories {
    case popular
    case topRated
    case upcoming

    var title : String {
        switch self {
        case .popular: return "Popular"
        case .topRated: return "Top Rated"
        case .upcoming: return "Upcoming"
        }
    }

    var image: UIImage {
           switch self {
               case .popular: return UIImage(named: "popular")!
               case .topRated: return UIImage(named: "star")!
               case .upcoming: return UIImage(named: "upcoming")!
           }
       }

}

// MARK: - Interactor

protocol SearchInteractorProtocol: class {
    var interactorOutputDelegate: SearchInteractorDelegate? { get set }
    func search(title: String) -> Observable<[Media]>
    func loadMovies(category: Categories) -> Observable<[Media]>
    func fetchLocalData() -> [Media]
}

protocol SearchInteractorDelegate: class {
    func handleInteractorOutput(_ output: SearchInteractorOutput)
}

enum SearchInteractorOutput {
    case setLoading(Bool)
    case getMediaList([Media])
    case allMovies([Media])
}

// MARK: - Presenter

protocol SearchPresenterProtocol: class {
    func search(title: String)
    func loadMovies()
    func validateNameField(name: String?)
    func showMediaList(mediaArray: [Media])
    func showMediaDetail(media: Media)
}

enum SearchPresenterOutput {
    case updateTitle(Categories)
    case setLoading(Bool)
    case searchResults([Media])
    case allMovies([Media])
    case isValidName(Bool)
}

// MARK: - Router

protocol SearchRouterProtocol: class {
    func navigate(to route: SearchRoute)
}

enum SearchRoute {
    case list([Media])
    case showMediaDetail(Media)
}
