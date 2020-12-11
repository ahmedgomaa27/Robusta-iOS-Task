//
//  RepositoryCell.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var repoImageView: UIImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!


    func setup(item: RepositoryListElement) {
        repositoryNameLabel.text = item.name
        ownerLabel.text = item.owner.login
        ImageDownloader.loadImage(imageUrlPath: item.owner.avatarURL) { (image) in
            self.repoImageView.image = image
        }
    }

}
