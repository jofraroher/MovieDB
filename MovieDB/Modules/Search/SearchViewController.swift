//
//  SearchViewController.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 02/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit
import AlamofireImage

class SearchViewController: UIViewController, SearchViewProtocol {

    // MARK: - Outlets

    @IBOutlet weak var searchTextField: UITextField!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIButton!

    // MARK: - Properties

    let imageURL: String = "https://image.tmdb.org/t/p/w500/"

    var mediaArray: [Media]?

    private var isValidName: Bool = false {
        didSet {
            handleNameField()
        }
    }

    var presenter: SearchPresenterProtocol!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
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
            self.mediaArray = movies
            self.collectionView.reloadData()
        case .updateTitle(let category):
            self.title = category.title
            self.tabBarItem.title = category.title
            self.tabBarItem.image = category.image
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
            break
        case .searchResults(let searchResults):
            self.presenter.showMediaList(mediaArray: searchResults)
        case .isValidName(let isValid):
            self.isValidName = isValid
        }
    }

    // MARK: - Helpers

    private func configureView() {

        presenter.loadMovies()

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 5

        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3.3

        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    private func handleNameField() {
        if !isValidName {
            showAlert(title: "Error", message: "The name field cannot be blank.")
        } else {
            presenter.search(title: searchTextField.text ?? "")
        }
    }

    // MARK: - Actions

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchTextField.resignFirstResponder()

        presenter.validateNameField(name: searchTextField.text)

        searchTextField.text = ""
    }
}

// MARK: - UITextFieldDelegate

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()

        return true
    }
}

// MARK: - Collection View Delegate and Data Source

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate{

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let media = self.mediaArray?[indexPath.row] else { return }
        presenter.showMediaDetail(media: media)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mediaArray?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        let movie = self.mediaArray?[indexPath.item]
        let baseUrl = URL(string: imageURL + (movie?.poster ?? ""))

        cell.posterImageView?.af.setImage(withURL: baseUrl!)
        cell.posterImageView?.tag = indexPath.row

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cell.posterImageView?.isUserInteractionEnabled = true
        cell.posterImageView?.addGestureRecognizer(tapGestureRecognizer)

        return cell
    }


    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedPoster = tapGestureRecognizer.view as! UIImageView
        guard let media = self.mediaArray?[tappedPoster.tag] else { return }
        presenter.showMediaDetail(media: media)
    }
}
