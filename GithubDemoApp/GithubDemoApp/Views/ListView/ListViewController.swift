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

    let searchController = UISearchController()
    var presenter: ListViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryCell else { return UITableViewCell() }
        cell.setup(item: presenter.getItem(for: indexPath.row))
        return cell
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
}
