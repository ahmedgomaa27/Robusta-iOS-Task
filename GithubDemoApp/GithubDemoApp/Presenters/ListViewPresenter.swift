//
//  ListViewPresenter.swift
//  GithubDemoApp
//
//  Created by Ahmed Hamdy on 10/12/2020.
//

import Foundation

class ListViewPresenter {

    weak var view: ListViewDelegate!
    var dataModel: [RepositoryListElement] = []

    init(view: ListViewDelegate) {
        self.view = view
    }

    func fetchReposData() {
        view.showLoading()
        NetworkManager.getRepositoriesWithCompletion { [weak self] (list) in
            guard let self = self else {return}
            self.view.hideLoading()
            if let reposList = list {
                self.dataModel.append(contentsOf: reposList)
            }
        }
    }
}
