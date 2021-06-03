//
//  MovieGridCell.swift
//  MovieDB
//
//  Created by Jose Francisco Rosales Hernandez on 03/06/21.
//  Copyright © 2021 Jose Francisco Rosales Hernandez. All rights reserved.
//

import Foundation

import UIKit

class MovieGridCell: UICollectionViewCell {

    @IBOutlet weak var posterImageView: UIImageView?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 7
    }
}
