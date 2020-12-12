//
//  RepositoryDetailsController.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 11/12/2020.
//

import SafariServices

class RepositoryDetailsController: UIViewController {

    @IBOutlet weak var repositoryImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsValueLabel: UILabel!
    @IBOutlet weak var forksValueLabel: UILabel!
    @IBOutlet weak var openIssuesLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!

    var repository: Repository?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let repository = repository {
            updateUIView(repository: repository)
        }
    }

    func updateUIView(repository: Repository) {
        getImage(url: repository.owner.avatarUrl)
        title = repository.name
        descriptionLabel.text = repository.repositoryDescription
        starsValueLabel.text = getTextValue(for: repository.stargazersCount)
        forksValueLabel.text = getTextValue(for: repository.forksCount)
        openIssuesLabel.text = getTextValue(for: repository.openIssuesCount)
        languageLabel.text = repository.language
    }

    func getImage(url: String) {
        ImageDownloader.loadImage(imageUrlPath: url) { (image) in
            DispatchQueue.main.async {
                self.repositoryImageView.image = image
            }
        }
    }

    func getTextValue(for number: Int) -> String {
        (number > 1000) ? "\(number / 1000)K": "\(number)"
    }

    @IBAction func visitWebSiteTapped(_ sender: UIButton) {
        if let urlPath = repository?.htmlUrl, let url = URL(string: urlPath) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
}
