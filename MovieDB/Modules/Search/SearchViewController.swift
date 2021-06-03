//
//  SearchViewController.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchViewProtocol {

    // MARK: - Outlets

    @IBOutlet weak var searchTextField: UITextField!

    @IBOutlet weak var filterButton: UIButton!

    var presenter: SearchPresenterProtocol!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - Handle Presenter Output

    func handlePresenterOutput(_ output: SearchPresenterOutput) {
        switch output {
        case .allMovies(let movies):
            break
        case .updateTitle(let category):
            self.title = category.title
            self.tabBarItem.title = category.title
            self.tabBarItem.image = category.image
        case .setLoading(let isLoading):
            break
        case .searchResults(let searchResults):
            self.presenter.showMediaList(mediaArray: searchResults)
        case .showYears(let years):
            break
        case .showTypes(let types):
            break
        case .isValidName(let isValid):
            break
        }
    }
}
