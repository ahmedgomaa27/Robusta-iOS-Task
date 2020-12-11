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


    func setup(item: Repository) {
        repositoryNameLabel.text = item.name
        ownerLabel.text = item.owner.login
        ImageDownloader.loadImage(imageUrlPath: item.owner.avatarUrl) { (image) in
            DispatchQueue.main.async {
                self.repoImageView.image = image
            }
        }
    }

    override func prepareForReuse() {
        repoImageView.image = nil
    }

}
