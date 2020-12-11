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
            DispatchQueue.main.async {
                self.repoImageView.image = image
            }
        }

        NetworkManager.getRepositoryDate(fromUrl: item.url) { (dateString) in
            if let date = dateString {
                self.dateLabel.isHidden = false
                self.dateLabel.text = "Created at: \(DateUtils.getRepositoryDateFormat(dateString: date))"
            } else {
                self.dateLabel.isHidden = true
            }
        }
    }

    override func prepareForReuse() {
        dateLabel.text = ""
        repoImageView.image = nil
    }

}
