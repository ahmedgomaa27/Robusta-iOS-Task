//
//  ViewController.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var repositoriesTableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var noResultsLabel: UILabel!

    let searchController = UISearchController()
    var presenter: ListViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Github Repositories"
        presenter = ListViewPresenter(view: self)
        setupSearchController()
        presenter.fetchReposData()
    }

    func setupSearchController() {
        searchController.searchBar.placeholder = "Enter Repository Name"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}

//MARK:- table view delegate
extension ListViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print(indexPaths)
        for indexPath in indexPaths {
            if indexPath.row >= presenter.listingModel.count - 1 {
                presenter.loadMore()
                break
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryCell else { return UITableViewCell() }
        cell.setup(item: presenter.getItem(for: indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repository = presenter.getItem(for: indexPath.row)
        if let detailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RepositoryDetailsController") as? RepositoryDetailsController {
            detailsVC.repository = repository
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

//MARK:- search bar delegate
extension ListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.clearSearch()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.search(with: searchText)
    }
}

//MARK:- presenter delegate
extension ListViewController: ListViewDelegate {
    func showLoading() {
        loadingIndicator.startAnimating()
    }

    func hideLoading() {
        loadingIndicator.stopAnimating()
    }

    func refreshView() {
        noResultsLabel.isHidden = true
        repositoriesTableView.isHidden = false
        repositoriesTableView.reloadData()
    }

    func showNetworkError() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong, please try again later", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Reload",
                                      style: UIAlertAction.Style.default,
                                      handler: { _ in
                                        self.presenter.fetchReposData()
                                      }))
        present(alert, animated: true, completion: nil)
    }

    func showNoResultsView() {
        noResultsLabel.isHidden = false
        repositoriesTableView.isHidden = true
    }
}
