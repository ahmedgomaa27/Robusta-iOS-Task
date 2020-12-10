//
//  ViewController.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

import UIKit

class ViewController: UIViewController {

    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager.getRepositoriesWithCompletion { (list) in
            print(list)
        }
        setupSearchController()
    }

    func setupSearchController() {
        searchController.searchBar.placeholder = "Enter Repository Name"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

}


extension ViewController: UISearchBarDelegate {

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //TODO: return to default data
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
