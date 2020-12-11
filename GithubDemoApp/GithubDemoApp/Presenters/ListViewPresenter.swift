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
    var filterModel: [RepositoryListElement] = []

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
                self.filterModel.append(contentsOf: reposList)
                self.view.refreshView()
            }
        }
    }

    func getItem(for index: Int) -> RepositoryListElement {
        filterModel[index]
    }

    func getNumberOfItems() -> Int {
        filterModel.count
    }

    func search(with keyWord: String) {
        filterModel.removeAll()
        filterModel.append(contentsOf: dataModel)
        if keyWord.count > 1 {
            filterModel = filterModel.filter({$0.name.lowercased().contains(keyWord.lowercased())})
        }
        view.refreshView()
    }

    func clearSearch() {
        filterModel.removeAll()
        filterModel.append(contentsOf: dataModel)
        view.refreshView()
    }
}
