//
//  MediaDetailViewController.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import WebKit
import YoutubePlayerView

class MediaDetailViewController: UIViewController{

    // MARK: - Outlets

    @IBOutlet weak var videoPreview: YoutubePlayerView!
    @IBOutlet weak var headerView: UIView!

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UITextView!
    @IBOutlet weak var moviePosterImg: UIImageView!

    // MARK: - Properties

    var presenter: MediaDetailPresenterProtocol!
    var media: Media!


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.load()
        presenter.getMovieDetail(id: media.id )
        configureView()

    }

    // MARK: - Handle Presenter Output


    // MARK: - Helpers

    func configureView(){
        self.title = media.title
        titleLbl.text = media.title
        descriptionLbl.text = media.overview

        let baseUrl = URL(string: "https://image.tmdb.org/t/p/w500/" + (media?.poster ?? ""))
        moviePosterImg.af.setImage(withURL: baseUrl!)
    }

    func getMovieTrailer(){
        if media.mediaType == "movie" {


        }
    }

    // MARK: - Actions

}


extension MediaDetailViewController: MediaDetailViewProtocol {
    func showMovieTrailer(trailerKey: String) {

        let playerVars: [String: Any] = [
            "controls": 1,
            "modestbranding": 1,
            "playsinline": 1,
            "origin": "https://youtube.com",
            "autoplay": 1
        ]
        videoPreview.delegate = self
        videoPreview.loadWithVideoId(trailerKey, with: playerVars)
    }

    func update(presentation media: Media) {
        self.media = media
    }
}

// MARK: - Video Player Delegate


extension MediaDetailViewController: YoutubePlayerViewDelegate {
    func playerViewDidBecomeReady(_ playerView: YoutubePlayerView) {
        print("Ready")
        videoPreview.fetchPlayerState { (state) in
            print("Fetch Player State: \(state)")
        }
    }

    func playerView(_ playerView: YoutubePlayerView, didChangedToState state: YoutubePlayerState) {
        print("Changed to state: \(state)")
    }

    func playerView(_ playerView: YoutubePlayerView, didChangeToQuality quality: YoutubePlaybackQuality) {
        print("Changed to quality: \(quality)")
    }

    func playerView(_ playerView: YoutubePlayerView, receivedError error: Error) {
        print("Error: \(error)")
    }

    func playerView(_ playerView: YoutubePlayerView, didPlayTime time: Float) {
        print("Play time: \(time)")
    }

    func playerViewPreferredInitialLoadingView(_ playerView: YoutubePlayerView) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }
}


