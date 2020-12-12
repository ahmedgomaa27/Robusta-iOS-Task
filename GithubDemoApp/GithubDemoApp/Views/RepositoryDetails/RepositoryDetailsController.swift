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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    var presenter: ListViewPresenter!
    var repositoryUrl: String = ""
    var repositoryWebSite: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = ListViewPresenter(view: self)
        presenter.getRepositoryDetails(url: repositoryUrl)
    }


    func updateUIView(repository: Repository) {
        getImage(url: repository.owner.avatarUrl)
        descriptionLabel.text = repository.repositoryDescription
        starsValueLabel.text = getTextValue(for: repository.stargazersCount)
        forksValueLabel.text = getTextValue(for: repository.forksCount)
        openIssuesLabel.text = getTextValue(for: repository.openIssuesCount)
        languageLabel.text = repository.language
        repositoryWebSite = repository.htmlUrl
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
        if let urlPath = repositoryWebSite, let url = URL(string: urlPath) {
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
        }
    }
}

//MARK:- presenter delegate
extension RepositoryDetailsController: ListViewDelegate {
    func showLoading() {
        loadingIndicator.startAnimating()
    }

    func hideLoading() {
        loadingIndicator.stopAnimating()
    }


    func showNetworkError() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong, please try again later", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Reload",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in
                                        self.presenter.getRepositoryDetails(url: self.repositoryUrl)
                                      }))
        present(alert, animated: true, completion: nil)
    }
    func updateDetailsView(repository: Repository) {
        updateUIView(repository: repository)
    }

}
