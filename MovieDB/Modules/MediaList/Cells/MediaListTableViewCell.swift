//
//  MediaListTableViewCell.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import UIKit

class MediaListTableViewCell: UITableViewCell {

    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var cellContainer: RoundedView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setView(title: String, type: String, imageURL: String) {
        self.selectionStyle = .none
        titleLabel.text = title
        typeLabel.text = type
        let baseUrl = URL(string: "https://image.tmdb.org/t/p/w500/" + imageURL)
        mediaImageView.af.setImage(withURL: baseUrl!)
    }
}
